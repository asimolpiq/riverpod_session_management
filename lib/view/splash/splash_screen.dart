import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_session_management/product/utility/assets_manager.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';
import 'package:riverpod_session_management/product/utility/project_spacers.dart';

import '../auth/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  void changeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ));
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
