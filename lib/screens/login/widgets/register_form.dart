import 'package:chess_project/screens/login/widgets/auth_widget.dart';
import 'package:chess_project/widgets/fields/custom_field_text.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

import '../../../resources/font_constants.dart';
import '../../../widgets/colors/default_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/validators/min_words_validator.dart';
import '../../../widgets/validators/password_validator.dart';

class RegisterForm extends AuthWidget {
  const RegisterForm({super.key});

  @override
  final String idScreen = 'register_form';

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                AppLocalizations.of(context)!.registerTitle,
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: FontsConstants.bebas.name,
                    color: lightTextColor),
              ),
              Text(AppLocalizations.of(context)!.registerSubtitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontsConstants.scrita.name,
                      color: lightTextColor)),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                textController: _nameController,
                labelText: AppLocalizations.of(context)!.registerName,
                keyboardType: TextInputType.text,
                validators: [
                  const RequiredValidator(),
                  const MinLengthValidator(length: 3),
                  MinWordsValidator(minWords: 2),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                textController: _emailController,
                labelText: AppLocalizations.of(context)!.email,
                keyboardType: TextInputType.emailAddress,
                validators: const [
                  RequiredValidator(),
                  EmailValidator(),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                textController: _phoneController,
                labelText: AppLocalizations.of(context)!.registerPhone,
                keyboardType: TextInputType.phone,
                validators: const [
                  RequiredValidator(),
                  PhoneNumberValidator()
                ],
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Register');
                  }
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    AppLocalizations.of(context)!.register,
                    style: const TextStyle(fontSize: 18, color: lightTextColor),
                  ),
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
