import 'package:intl/intl.dart';

import '../../constant.dart';

extension CurrencyFormatter on double {
  String get currencyFormat {
    final numberFormat = NumberFormat.decimalPattern(Constant.currentLocale);
    final formatted = numberFormat.format(this);

    return Constant.currencyPositionIsLeft
        ? '${Constant.currencySymbol} $formatted'
        : '$formatted ${Constant.currencySymbol}';
  }

}

