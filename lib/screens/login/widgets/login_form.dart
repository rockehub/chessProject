import 'package:chess_project/screens/login/widgets/auth_widget.dart';
import 'package:chess_project/screens/login/widgets/register_form.dart';
import 'package:chess_project/widgets/fields/custom_field_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_validation/form_validation.dart';

import '../../../resources/font_constants.dart';
import '../../../widgets/colors/default_colors.dart';
import '../../../widgets/validators/password_validator.dart';

class LoginForm extends AuthWidget {
  @override
  final String idScreen = 'login_form';

  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  AppLocalizations.of(context)!.loginTitle,
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: FontsConstants.bebas.name,
                      color: lightTextColor),
                ),
                Text(AppLocalizations.of(context)!.loginSubtitle,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: FontsConstants.scrita.name,
                        color: lightTextColor)),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  validators: const [
                    RequiredValidator(),
                    EmailValidator(),
                  ],
                  textController: _emailController,
                  labelText: AppLocalizations.of(context)!.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validators: [
                    const RequiredValidator(),
                    PasswordValidator(componentContext: context),
                  ],
                  textController: _passwordController,
                  labelText: AppLocalizations.of(context)!.password,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: lightTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(AppLocalizations.of(context)!
                                          .loginTitle),
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .loginSubtitle),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!.ok),
                                        )
                                      ],
                                    );
                                  })
                            }
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(AppLocalizations.of(context)!.signIn,
                          style: const TextStyle(
                              fontSize: 18, color: lightTextColor)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.pushNamed(
                              context, const RegisterForm().idScreen)
                        },
                    child: Text(AppLocalizations.of(context)!.dontHaveAccount,
                        style: const TextStyle(
                            fontSize: 18, color: lightTextColor)))
              ],
            ),
          );
        }));
  }
}
