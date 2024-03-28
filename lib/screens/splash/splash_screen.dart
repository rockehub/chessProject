import 'dart:io';

import 'package:chess_project/screens/home/home_page.dart';
import 'package:chess_project/widgets/colors/default_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  static const String idScreen = 'splash';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (!kIsWeb &&
        (Platform.isWindows || Platform.isIOS || Platform.isAndroid)) {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.notification].request();

      bool allGranted = true;

      statuses.forEach((permission, permissionStatus) async {
        if (!permissionStatus.isGranted) {
          allGranted = false;
          await permission.request();
        }
      });

      if (allGranted) {
        _checkValidations();
      } else {
        // Navigator.of(context).pop();
        _requestPermissions();
      }
    } else {
      _checkValidations();
    }
  }

  Future<void> _checkValidations() async {
    //add wait
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushNamedAndRemoveUntil(
        context, HomePage.idScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: defaultGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/logo.png',
            width: 100,
            height: 100,
            alignment: Alignment.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "ChessProject",
            style: TextStyle(
                fontSize: 32, fontFamily: 'Scrita', color: lightTextColor),
          ),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(lightTextColor),
          ),
        ],
      ),
    ));
  }
}
