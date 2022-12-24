import 'package:flutter/material.dart';
import 'package:riverpod_session_management/product/utility/project_colors.dart';

class BoxDecorationUtilitys {
  static BoxDecoration gradientScaffold = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 0.7, 1],
      colors: [
        ProjectColors.primaryLight,
        ProjectColors.lightGrey,
        Colors.white,
      ],
    ),
  );
}
