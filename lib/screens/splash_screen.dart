import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retech/resources/colors.dart';
import 'package:retech/resources/images.dart';
import 'package:retech/screens/login_screen.dart';
import 'package:retech/utils/shared_pref.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadAppDetails(context);
    SharedPref.setIsLoggedIn(false);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(fit: BoxFit.fitWidth, Images.SPLASH_IMAGE),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            alignment: Alignment.bottomCenter,
            child: const CircularProgressIndicator(
              color: ColorsApp.secondary,
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }

  loadAppDetails(context) async {
    SharedPref.setIsLoggedIn(false); // Its just for testing

    if (MediaQuery.of(context).size.width < 600) {
      SharedPref.setDeviceType('mobile');
    } else {
      SharedPref.setDeviceType('tablet');
    }

    bool isLoggedIn = SharedPref.getIsLoggedIn();

    if (!isLoggedIn) {
      // timer for splash screen
      Future.delayed(const Duration(seconds: 1), () {
        directToLoginScreen(context);
      });
    }
  }

  directToLoginScreen(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const LogIn();
    }));
  }
}
