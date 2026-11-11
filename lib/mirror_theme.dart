import 'package:flutter/material.dart';

/// Design tokens and helpers for the "Dark Mirror / Reflective Glass / Polished Metal" visual identity.
class MirrorColors {
  // Backgrounds: Deep black and graphite
  static const Color background = Color(0xFF090A0E);
  static const Color backgroundSecondary = Color(0xFF0E1017);
  static const Color surface = Color(0xFF131620);
  static const Color surfaceTranslucent = Color(0xE6141824); // 90% opacity for glass feel

  // Polished Metal / Glass Borders
  static const Color borderSubtle = Color(0xFF222738);
  static const Color borderHighlight = Color(0xFF38415C);
  static const Color glassHighlight = Color(0x1AFFFFFF);

  // Metallic Accents (Champagne Platinum / Reflective Titanium Gold)
  static const Color accent = Color(0xFFE5C86C);
  static const Color accentSteel = Color(0xFF94A3B8);
  static const Color onAccent = Color(0xFF08090D);

  // Text
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
}

class MirrorDecorations {
  /// Reflective glass card decoration with subtle border highlight
  static BoxDecoration glassCard({
    double radius = 16,
    Color? borderColor,
  }) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF161A26),
          Color(0xFF0F121C),
        ],
      ),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: borderColor ?? MirrorColors.borderSubtle,
        width: 1,
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x40000000),
          blurRadius: 16,
          offset: Offset(0, 6),
        ),
      ],
    );
  }

  /// Polished metallic gradient container for hero headers and banners
  static BoxDecoration metallicSurface({
    double radius = 16,
  }) {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1C2234),
          Color(0xFF10131E),
        ],
      ),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: MirrorColors.borderHighlight,
        width: 1,
      ),
    );
  }

  /// Subtle top divider with specular reflection
  static BoxDecoration topDivider() {
    return const BoxDecoration(
      border: Border(
        top: BorderSide(
          color: MirrorColors.borderSubtle,
          width: 1,
        ),
      ),
    );
  }
}

