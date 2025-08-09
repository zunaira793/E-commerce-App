
import 'package:e_commerce_app/core/theme.dart';
import 'package:e_commerce_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../utils/ui_utils.dart';
import '../../../widgets/custom_text.dart';

class Widgets {
  static bool isLoadingShowing = false;
  static void showLoader(BuildContext context) async {
    if (isLoadingShowing) {
      return;
    }
    isLoadingShowing = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: true,
        builder: (BuildContext context) {
          return AnnotatedRegion(
            value: UiUtils.getSystemUiOverlayStyle(context:context,
              statusBarColor: Colors.black.withValues(alpha: 0),
            ),
            child: SafeArea(
              child: PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  return;
                },
                child: Center(
                  child: UiUtils.progress(
                    normalProgressColor: context.color.territoryColor,
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void hideLoder(BuildContext context) {
    if (isLoadingShowing) {
      isLoadingShowing = false;
      Navigator.of(context).pop();
    }
  }

  static Center noDataFound(String errorMsg) {
    return Center(child: CustomText(errorMsg));
  }
}
