import 'package:flutter/cupertino.dart';
import 'package:form_validation/form_validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordValidator extends ValueValidator {
  static const String validatorType = 'password_validator';

  BuildContext? componentContext;

  PasswordValidator({Key? key,  this.componentContext});

  @override
  String get type => PasswordValidator.validatorType;

  static PasswordValidator fromDynamic(dynamic map) {
    if (map == null || map['type'] != validatorType) {
      return PasswordValidator();
    }
    return PasswordValidator();
  }

  @override
  Map<String, dynamic> toJson() => {
        "type": type,
      };

  @override
  String? validate({
    @required BuildContext? context,
    required String label,
    @required String? value,
  }) {
    if (value?.isEmpty ?? true) {
      return null;
    }

    if (value!.length < 8) {
      return AppLocalizations.of(componentContext!)!.passwordLength;
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppLocalizations.of(componentContext!)!.passwordUppercase;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppLocalizations.of(componentContext!)!.passwordNumber;
    }

    return null;
  }
}
