import 'package:flutter/cupertino.dart';

import '../../../core/localization.dart';

extension TranslateString on String {
  String translate(BuildContext context) {
    return (AppLocalization.of(context)!.getTranslatedValues(this) ?? this)
        .trim();
  }
}
