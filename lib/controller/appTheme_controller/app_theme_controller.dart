import 'package:get/get.dart';
import '../../core/app_themes.dart';
import '../../utils/hive_utils.dart';


class AppThemeController extends GetxController {
  var appTheme = AppTheme.light.obs;

  void loadTheme() {
    appTheme.value = HiveUtils.getCurrentTheme();
  }

  /// Change theme
  void changeTheme(AppTheme theme) {
    HiveUtils.setCurrentTheme(theme);
    appTheme.value = theme;
  }

  /// Toggle between light and dark mode
  void toggleTheme() {
    if (appTheme.value == AppTheme.dark) {
      HiveUtils.setCurrentTheme(AppTheme.light);
      appTheme.value = AppTheme.light;
    } else {
      HiveUtils.setCurrentTheme(AppTheme.dark);
      appTheme.value = AppTheme.dark;
    }
  }

  /// Check if dark mode is active
  bool isDarkMode() {
    return appTheme.value == AppTheme.dark;
  }
}
