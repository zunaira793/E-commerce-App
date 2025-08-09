
import 'package:e_commerce_app/core/theme.dart';
import 'package:e_commerce_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/app_icon/app_icon.dart';
import '../../utils/ui_utils.dart';
import '../custom_text.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternet({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: UiUtils.getSystemUiOverlayStyle(
          context: context, statusBarColor: context.color.primaryColor),
      child: Scaffold(
        backgroundColor: context.color.backgroundColor,
        body: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiUtils.getSvg(AppIcons.no_internet),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                "noInternet".translate(context),
                fontSize: context.font.extraLarge,
                color: context.color.territoryColor,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: context.screenWidth * 0.8,
                  child: CustomText(
                    "noInternetErrorMsg".translate(context),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: onRetry,
                  style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                          context.color.territoryColor.withValues(alpha: 0.2))),
                  child: CustomText(
                    "retry".translate(context),
                    color: context.color.territoryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
