
import 'package:e_commerce_app/core/theme.dart';
import 'package:e_commerce_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constant.dart';
import 'custom_text.dart';

class MaintenanceMode extends StatelessWidget {
  const MaintenanceMode({super.key});
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return const MaintenanceMode();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/${Constant.maintenanceModeLottieFile}",
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText("maintenanceModeMessage".translate(context),
                  color: context.color.textColorDark,
                  textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
