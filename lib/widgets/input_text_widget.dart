import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextWidget extends StatelessWidget {
  final String? fieldContent;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorMessage;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final Function? onEditingComplete;
  final bool? isSecureText;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final int? maxInput;
  final int? maxLines;
  final Color? color;
  final TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  final bool? isUsingSymbol;
  final TextAlign? textAlign;
  final double? borderSideWidth;
  final bool? isWithShadow;
  final FontWeight? fontWeight;
  final double? radius;
  final String? initialValue;

  InputTextWidget(
      {@required this.textEditingController,
      @required this.hintText,
      this.errorMessage = 'cant empty',
      this.onSaved,
      this.focusNode,
      this.onChanged,
      this.onEditingComplete,
      this.isSecureText = false,
      this.textInputAction = TextInputAction.next,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.height,
      this.width,
      this.fieldContent,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.maxInput = 50,
      this.color = Colors.black,
      this.maxLines,
      this.textCapitalization = TextCapitalization.none,
      this.inputFormatters,
      this.textAlign = TextAlign.left,
      this.isUsingSymbol = false,
      this.isWithShadow = false,
      this.borderSideWidth = 0.1,
      this.fontWeight = FontWeight.w400,
      this.radius = 30,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    inputFormatters = [
      LengthLimitingTextInputFormatter(maxInput),
      if (isUsingSymbol!) FilteringTextInputFormatter.allow(RegExp('[A-Z0-9]')),
    ];
    return Container(
      height: height,
      width: width,
      decoration: isWithShadow!
          ? const BoxDecoration(boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey, blurRadius: 30.0, offset: Offset(0, 10))
            ])
          : const BoxDecoration(),
      child: TextFormField(
        textAlign: textAlign!,
        readOnly: readOnly!,
        textInputAction: textInputAction,
        controller: textEditingController,
        focusNode: focusNode,
        maxLines: maxLines,
        style: GoogleFonts.inter(
            color: color, fontSize: 14, fontWeight: fontWeight),
        obscureText: isSecureText!,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius!)),
            borderSide: BorderSide(color: Colors.grey, width: borderSideWidth!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius!)),
            borderSide: BorderSide(color: Colors.grey, width: borderSideWidth!),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        textCapitalization: textCapitalization!,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty)
                return errorMessage;
              else
                return null;
            },
        onSaved: onSaved,
        onChanged: onChanged,
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        initialValue: initialValue,
      ),
    );
  }
}
