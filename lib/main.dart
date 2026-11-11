import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'l10n/app_localizations.dart';

import 'analytics.dart';
import 'branding.dart';
import 'firebase_options.dart';
import 'mirror_theme.dart';
import 'state.dart';
import 'views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    Analytics.captureError(details.exception, details.stack ?? StackTrace.current);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    Analytics.captureError(error, stack);
    return true;
  };

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const SubGuardApp());
}

class SubGuardApp extends StatefulWidget {
  const SubGuardApp({super.key});

  @override
  State<SubGuardApp> createState() => _SubGuardAppState();
}

class _SubGuardAppState extends State<SubGuardApp> {
  final app = AppState();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: app,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppBranding.appName,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: app.locale,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: const ColorScheme.dark(
              primary: MirrorColors.accent,          // Polished titanium gold accent
              secondary: MirrorColors.accentSteel,    // Polished steel
              surface: MirrorColors.surface,          // Deep obsidian glass surface
              onPrimary: MirrorColors.onAccent,       // Contrast dark on gold
              onSecondary: Colors.white,
              onSurface: MirrorColors.textPrimary,
            ),
            scaffoldBackgroundColor: MirrorColors.background,
            textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
              headlineLarge: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: MirrorColors.textPrimary,
                  letterSpacing: -1.5,
                ),
              ),
              headlineMedium: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: MirrorColors.textPrimary,
                  letterSpacing: -1.0,
                ),
              ),
              titleLarge: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: MirrorColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: MirrorColors.background,
              elevation: 0,
              centerTitle: false,
              surfaceTintColor: Colors.transparent,
              titleTextStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: MirrorColors.textPrimary,
                letterSpacing: -0.3,
              ),
            ),
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: MirrorColors.backgroundSecondary,
              indicatorColor: MirrorColors.accent,
              iconTheme: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const IconThemeData(color: MirrorColors.onAccent, size: 22);
                }
                return const IconThemeData(color: Colors.white38, size: 22);
              }),
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    color: MirrorColors.accent,
                    letterSpacing: 0.8,
                  );
                }
                return const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: Colors.white38,
                  letterSpacing: 0.8,
                );
              }),
            ),
            cardTheme: CardThemeData(
              color: MirrorColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: MirrorColors.borderSubtle, width: 1),
              ),
              elevation: 0,
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: MirrorColors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: MirrorColors.borderSubtle),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: MirrorColors.borderSubtle),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: MirrorColors.accent, width: 1.5),
              ),
              labelStyle: const TextStyle(color: MirrorColors.textSecondary, fontWeight: FontWeight.w600),
              hintStyle: const TextStyle(color: MirrorColors.textMuted),
              prefixIconColor: MirrorColors.textSecondary,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: MirrorColors.accent,
                foregroundColor: MirrorColors.onAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            dividerTheme: const DividerThemeData(color: MirrorColors.borderSubtle, thickness: 1),
          ),
          home: app.authed ? Shell(app: app) : AuthView(app: app),
        );
      },
    );
  }
}
