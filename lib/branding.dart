/// Centralized branding configuration for the application.
/// Keep the application name centralized so any future brand name
/// can be updated in one place without touching individual screens.
class AppBranding {
  /// The user-facing application name placeholder.
  static const String appName = 'NEW_APP_NAME';

  /// Tagline / subtitle displayed in hero sections
  static const String tagline = 'Digital Relocation Platform';

  /// Formatted title for hero banners and navigation headers
  static const String fullTitle = '$appName • $tagline';

  /// AI Assistant title
  static const String assistantName = '$appName Assistant';

  /// Premium subscription title
  static const String premiumPlanName = '$appName Premium Pass';

  /// Legal and Terms reference
  static const String termsSummary =
      'By using $appName, you agree to provide accurate registration information and use the app only for lawful service requests. $appName provides guidance and order management rather than official government services.';

  /// Privacy summary
  static const String privacySummary =
      '$appName collects basic profile information such as name, email, and selected country. Sensitive data is kept minimal and protected.';
}

