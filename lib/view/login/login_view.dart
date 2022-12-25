import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/product/components/login/custom_page_header.dart';
import 'package:riverpod_session_management/product/strings/auth_strings.dart';
import 'package:riverpod_session_management/product/utility/assets_manager.dart';
import 'package:riverpod_session_management/product/utility/box_decorations_utility.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';
import 'package:riverpod_session_management/product/utility/project_paddings.dart';
import 'package:riverpod_session_management/product/utility/project_spacers.dart';
import 'package:riverpod_session_management/view/login/model/login_view_model.dart';

import '../../product/components/login/login_form_field.dart';
part '../../product/components/login/auth_buttons.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

enum TextEditingType {
  email,
  password,
}

class _LoginPageState extends LoginViewModel {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  final LoginStrings loginStrings = LoginStrings();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
        child: Container(
      decoration: BoxDecorationUtilitys.gradientScaffold,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                  duration: context.durationLow,
                  height: context.isKeyBoardOpen ? kToolbarHeight * 1.7 : MediaQuery.of(context).size.height / 3,
                  child: CustomPageHeader.customPageHeader(context)),
              ProjectSpacers.customSpacer,
              Form(
                key: formKey,
                child: Padding(
                  padding: ProjectPaddings.horizontal20,
                  child: Column(
                    children: [
                      LoginFormField(
                        editingController: emailController,
                        icon: Icon(CupertinoIcons.mail, color: context.colorScheme.onSurface),
                        hintText: loginStrings.emailHint,
                        textEditingType: TextEditingType.email,
                      ),
                      ProjectSpacers.spacer16,
                      LoginFormField(
                        editingController: passwordController,
                        icon: Icon(
                          CupertinoIcons.lock,
                          color: context.colorScheme.onSurface,
                        ),
                        hintText: loginStrings.passwordHint,
                        textEditingType: TextEditingType.password,
                      ),
                      ProjectSpacers.spacer16,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            bool isValid = formKey.currentState!.validate();
                            if (isValid) {
                              fetchUserLogin(emailController.text, passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors.primary,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customMaterialButton(onPressed: () {}, text: loginStrings.forgotPasswordText),
                        ],
                      ),
                      ProjectSpacers.spacer20,
                      buildOrText(),
                      ProjectSpacers.spacer20,
                      buildLoginWithGoogle(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
