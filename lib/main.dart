import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'product/utility/project_colors.dart';
import 'view/splash/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asimolpiq Riverpod Session Management ',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: ProjectColors.primary,
            // toolbarHeight: kToolbarHeight - 10,
            centerTitle: true),
      ),
      home: const SplashScreen(),
    );
  }
}
