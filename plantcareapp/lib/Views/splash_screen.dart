import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantcareapp/Route/navigationbar.dart';
import 'package:plantcareapp/Uitls/colors.dart';
import 'package:plantcareapp/Uitls/images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kLightYellow,
      body: Center(child: Image.asset(CustomAssets.kSplashLogo)),
    );
  }

  @override
  void initState() {
    13.seconds.delay().then((v) {
      return Get.offAll(() => const NavigationBarScreen());
    });
    super.initState();
  }
}
