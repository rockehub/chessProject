import 'package:chess_project/screens/home/home_page.dart';
import 'package:chess_project/screens/login/authentication_page.dart';
import 'package:chess_project/screens/login/widgets/login_form.dart';
import 'package:chess_project/screens/login/widgets/register_form.dart';
import 'package:chess_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Chess Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: const LoginForm().idScreen,
      routes: {
        SplashScreen.idScreen: (context) => const SplashScreen(),
        HomePage.idScreen: (context) => const HomePage(),
        const LoginForm().idScreen: (context) => const AuthenticationPage(form: LoginForm()),
        const RegisterForm().idScreen: (context) => const AuthenticationPage(form: RegisterForm())
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
