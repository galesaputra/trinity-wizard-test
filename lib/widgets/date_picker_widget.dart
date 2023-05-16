import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DatePickerWIdget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String hint;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final bool isSecureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillcolor;
  final List<TextInputFormatter>? textInputFormatter;
  final bool isBold;
  final double fontSize;
  final TextAlign textAlign;
  final double verticalPadding;
  final Key? key;

  DatePickerWIdget(
      {this.textEditingController,
      this.hint = "",
      this.onSaved,
      this.focusNode,
      this.onChanged,
      this.isSecureText = false,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.words,
      this.prefixIcon,
      this.fillcolor,
      this.onTap,
      this.onFieldSubmitted,
      this.textInputFormatter,
      this.isBold = false,
      this.fontSize = 14.0,
      this.textAlign = TextAlign.start,
      this.verticalPadding = 12.0,
      this.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      textInputAction: textInputAction,
      controller: textEditingController,
      focusNode: focusNode,
      style: TextStyle(
          fontFamily: 'poppinsRegular',
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      obscureText: isSecureText,
      keyboardType: keyboardType,
      onTap: onTap,
      inputFormatters: textInputFormatter,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        fillColor: fillcolor == null ? Colors.white : fillcolor,
        filled: true,
        hintStyle: const TextStyle(
          fontFamily: "poppinsRegular",
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: 15,
        ),
      ),
      textCapitalization: textCapitalization,
      validator: validator,
      onSaved: onSaved,
      textAlign: textAlign,
      onChanged: onChanged,
    );
  }
}
