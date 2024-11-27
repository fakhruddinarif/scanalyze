import 'package:flutter/material.dart';
import 'package:scanalyze_app/utils/constants/colors.dart';
import 'package:scanalyze_app/utils/helpers/helper_functions.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScanalyzeColors.white,
      body: Center(
        child: Center(
          child: Container(
            width: ScanalyzeHelperFunctions.screenWidth(context) * 0.5,
            height: ScanalyzeHelperFunctions.screenWidth(context) * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}