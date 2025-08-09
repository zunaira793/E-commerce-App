import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/utils/constant.dart';
import 'package:e_commerce_app/utils/hive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'controller/appTheme_controller/app_theme_controller.dart';
import 'controller/lang_controller/language_controller.dart';
import 'core/app_initializer.dart';
import 'core/app_themes.dart';
import 'core/localization.dart';
import 'core/routes.dart';



void main() => initApp();

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(AppThemeController());
    final languageController = Get.put(LanguageController());

    languageController.loadCurrentLanguage();
    themeController.changeTheme(HiveUtils.getCurrentTheme());

    return const App();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<AppThemeController>();
    final languageController = Get.find<LanguageController>();

    return Obx(() {
      AppTheme currentTheme = themeController.appTheme.value;
      return GetMaterialApp(
        initialRoute: Routes.splash,
        navigatorKey: Constant.navigatorKey,
        title: Constant.appName,
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: Routes.onGenerateRouted,
        theme: appThemeData[currentTheme],
        builder: (context, child) {
          TextDirection direction =
          languageController.isRtl ? TextDirection.rtl : TextDirection.ltr;

          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: Directionality(
              textDirection: direction,
              child: DevicePreview(
                enabled: false,
                builder: (context) {
                  return child!;
                },
              ),
            ),
          );
        },
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _loadLocalLanguageIfFail(languageController),
      );
    });
  }

  Locale _loadLocalLanguageIfFail(LanguageController langController) {
    if (!langController.loadFailed) {
      return Locale(langController.code);
    } else {
      return const Locale("en");
    }
  }

}


// Keep scroll behavior
class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
