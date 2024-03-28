import 'package:chess_project/widgets/colors/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? textController;
  final List<ValueValidator>? validators;
  final Color? textColor;
  final bool? fillable;
  final Function? onChanged;

  const CustomTextField({
    Key? key,
    this.onChanged,
    this.fillable,
    this.textColor,
    this.textController,
    this.validators,
    this.labelText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  String? _previousValue;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && widget.fillable == true) {
        // Store the previous value before clearing
        _previousValue = widget.textController?.text;
        widget.textController?.clear();
      } else if (!_focusNode.hasFocus && widget.fillable == true) {
        // Check if the current value is empty when focus is lost
        if ((widget.textController?.text ?? '').isEmpty) {
          widget.textController?.text = _previousValue ?? '';
        }
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      style: TextStyle(fontSize: 14, color: widget.textColor ?? Colors.white),
      validator: (value) {
        if (widget.validators == null) return null;
        final validator = Validator(validators: widget.validators ?? []);

        return validator.validate(
          value: value,
          label: widget.labelText ?? '',
        );
      },
      controller: widget.textController,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.white),
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintStyle: const TextStyle(
          color: lightTextColor,
          fontSize: 10,
        ),
        // Outras estilizações comuns podem ser adicionadas aqui
      ),
    );
  }
}
