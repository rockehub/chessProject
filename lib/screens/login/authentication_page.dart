import 'package:chess_project/screens/login/widgets/auth_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/colors/default_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthenticationPage extends StatefulWidget {
  final AuthWidget form;

  const AuthenticationPage({Key? key, required this.form}) : super(key: key);

  @override
  AuthenticatePageState createState() => AuthenticatePageState();
}

class AuthenticatePageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: defaultGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 100),
                    // Placeholder for logo positioning
                    Image.asset(
                      'assets/img/logo.png',
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 20),
                    // Placeholder for spacing
                    widget.form,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                AppLocalizations.of(context)!.copyRight, //hot reload to genrate
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
