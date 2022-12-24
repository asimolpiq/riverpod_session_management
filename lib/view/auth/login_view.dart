import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/product/components/auth/auth_buttons.dart';
import 'package:riverpod_session_management/product/components/auth/custom_page_header.dart';
import 'package:riverpod_session_management/product/strings/auth_strings.dart';
import 'package:riverpod_session_management/product/utility/box_decorations_utility.dart';
import 'package:riverpod_session_management/product/utility/project_paddings.dart';
import 'package:riverpod_session_management/product/utility/project_spacers.dart';
import 'package:riverpod_session_management/view/auth/model/login_view_model.dart';

import '../../product/components/auth/login_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
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
  final AuthButtons authButtons = AuthButtons();
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
                      authButtons.buildLoginButton(formKey, context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          authButtons.customMaterialButton(onPressed: () {}, text: loginStrings.forgotPasswordText),
                        ],
                      ),
                      ProjectSpacers.spacer20,
                      authButtons.buildOrText(),
                      ProjectSpacers.spacer20,
                      authButtons.buildLoginWithGoogle(),
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
