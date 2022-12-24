import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';
import 'package:riverpod_session_management/product/utility/project_paddings.dart';
import '../../../view/home/home_view.dart';
import '../../strings/auth_strings.dart';
import '../../utility/assets_manager.dart';
import '../../utility/project_spacers.dart';

class AuthButtons {
  final LoginStrings loginStrings = LoginStrings();

  SizedBox buildLoginButton(GlobalKey<FormState> formKey, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          bool isValid = formKey.currentState!.validate();
          if (isValid) {
            context.navigation.popUntil((route) => false);
            context.navigation.push(MaterialPageRoute(
              builder: (context) => const Homepage(),
            ));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: ProjectPaddings.radiusCircular,
          ),
          fixedSize: const Size(0, 50),
        ),
        child: Text(
          loginStrings.login,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Row buildOrText() {
    return Row(
      children: [
        const Flexible(child: Divider()),
        Padding(
          padding: ProjectSpacers.horizontalNormalPadding,
          child: Text(
            loginStrings.orText,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const Flexible(child: Divider()),
      ],
    );
  }

  MaterialButton customMaterialButton({required Function onPressed, required String text}) {
    return MaterialButton(
        elevation: 0,
        splashColor: Colors.transparent,
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ));
  }

  SizedBox buildLoginWithGoogle() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white70,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fixedSize: const Size(0, 50),
        ),
        child: Padding(
          padding: ProjectSpacers.horizontalNormalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 24,
                child: CircleAvatar(
                  backgroundColor: ProjectColors.lightGrey,
                  child: AssetManager.getPngImage("google"),
                ),
              ),
              Text(
                loginStrings.googleWithLogin,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 17),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
