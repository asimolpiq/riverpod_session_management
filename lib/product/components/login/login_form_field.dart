import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../view/login/login_view.dart';

class LoginFormField extends StatefulWidget {
  final TextEditingController editingController;
  final Icon icon;
  final String hintText;
  final TextEditingType textEditingType;
  const LoginFormField(
      {super.key,
      required this.editingController,
      required this.icon,
      required this.hintText,
      required this.textEditingType});

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  final formKey = GlobalKey<FormState>();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(textStyle: TextStyle(color: context.colorScheme.onSurface)),
      controller: widget.editingController,
      keyboardType:
          widget.textEditingType == TextEditingType.email ? TextInputType.emailAddress : TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alan boş bırakılamaz';
        }
        switch (widget.textEditingType) {
          case TextEditingType.email:
            return value.isValidEmail ? null : 'Lütfen Geçerli Bir Email Adresi Giriniz.';
          case TextEditingType.password:
            return value.length > 6
                ? null
                : 'Lütfen Şifrenizin A-z | 0-9 | !@#\$&*~ Karakterlerini \nİçerdiğinden Ve 8 karakterli olduğundan emin olun';

          default:
            return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      obscureText: widget.textEditingType == TextEditingType.password ? !isVisible : false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          fillColor: Colors.white,
          filled: true,
          hoverColor: Colors.black,
          focusColor: Colors.black,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.2),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.onSurface), borderRadius: BorderRadius.circular(30)),
          hintStyle: TextStyle(color: context.colorScheme.onSurface),
          hintText: widget.hintText,
          suffixIcon: widget.textEditingType == TextEditingType.password
              ? IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: isVisible
                      ? const Icon(CupertinoIcons.eye_slash_fill, color: Colors.black)
                      : const Icon(
                          CupertinoIcons.eye,
                          color: Colors.black,
                        ))
              : const SizedBox(),
          prefixIcon: widget.icon),
    );
  }
}
