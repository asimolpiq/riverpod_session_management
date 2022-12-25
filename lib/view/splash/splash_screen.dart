import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/core/auth_manager.dart';
import 'package:riverpod_session_management/model/user_model.dart';
import 'package:riverpod_session_management/product/utility/assets_manager.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';
import 'package:riverpod_session_management/product/utility/project_spacers.dart';
import 'package:riverpod_session_management/view/auth/login_view.dart';
import 'package:riverpod_session_management/view/home/home_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    controlToLogin();
  }

  Future<void> controlToLogin() async {
    await ref.read(AuthProvider).fetchUserLogin();
    if (ref.read(AuthProvider).isLogin) {
      await Future.delayed(const Duration(seconds: 1));
      ref.read(AuthProvider).model = UserModel.fake();
      context.navigation.popUntil((route) => false);
      context.navigation.push(MaterialPageRoute(builder: (context) => const Homepage()));
    } else {
      await Future.delayed(const Duration(seconds: 3));
      context.navigation.push(MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.primary,
      appBar: AppBar(
        backgroundColor: ProjectColors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: CircleAvatar(
                backgroundColor: ProjectColors.lightGrey,
                maxRadius: 120,
                minRadius: 100,
                child: AssetManager.getPngImageSizedNFilled("logo", fit: BoxFit.fitHeight, height: 200),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: ProjectSpacers.spacer20,
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Hoş Geldiniz!",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: context.colorScheme.surface.withOpacity(0.9), fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                ),
              )),
          const Expanded(
              flex: 4,
              child: Center(
                child: CircularProgressIndicator(
                  color: ProjectColors.lightGrey,
                ),
              ))
        ],
      ),
    );
  }
}
