import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

class MinWordsValidator extends ValueValidator {
  static const String validatorType = 'min_words_validator';

  final int minWords;

  BuildContext? componentContext;

  MinWordsValidator({Key? key, required this.minWords, this.componentContext});

  @override
  String get type => MinWordsValidator.validatorType;

  static MinWordsValidator fromDynamic(dynamic map) {
    if (map == null || map['type'] != validatorType) {
      return MinWordsValidator(minWords: 0);
    }
    return MinWordsValidator(minWords: map['minWords']);
  }

  @override
  Map<String, dynamic> toJson() => {
    "type": type,
    "minWords": minWords,
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

    if (value!.split(' ').length < minWords) {
      return 'The $label must contain at least $minWords words.';
    }

    return null;
  }


}
