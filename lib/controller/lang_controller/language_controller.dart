import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../utils/hive_keys.dart';

class LanguageController extends GetxController {
  var language = Rxn<dynamic>();
  var error = "".obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    loadCurrentLanguage();
    super.onInit();
  }

  void loadCurrentLanguage() {
    var lang = Hive.box(HiveKeys.languageBox).get(HiveKeys.currentLanguageKey);

    if (lang != null) {
      language.value = lang;
      isLoaded.value = true;
      error.value = "";
    } else {
      error.value = "error";
      isLoaded.value = false;
      language.value = null;
    }
  }

  void changeLanguage(dynamic map) {
    language.value = map;
    isLoaded.value = true;
  }

  String? currentLanguageCode() {
    return language.value?['code'];
  }

  String? currentCountryCode() {
    return language.value?['country_code'];
  }

  // 🔹 Add back these getters for compatibility
  bool get loadFailed => !isLoaded.value;
  String get code => currentLanguageCode() ?? "en";
  bool get isRtl => (language.value?['rtl'] ?? false) == true;
}
