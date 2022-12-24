// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:riverpod_session_management/product/utility/assets_manager.dart';

// ignore: camel_case_types
enum _images { left_elips, right_elips, logo, logo_white }

class CustomPageHeader {
  static Stack customPageHeader(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
        )),
        Positioned(
          child: AssetManager.getPngImage(_images.left_elips.name, alignment: Alignment.topLeft),
        ),
        Positioned(right: 0, child: AssetManager.getPngImage(_images.right_elips.name, alignment: Alignment.topRight)),
        // Positioned(
        //     top: 180,
        //     right: 0,
        //     left: 0,
        //     child: Text(
        //       textAlign: TextAlign.center,
        //       LoginStrings.login,
        //       style: Theme.of(context).textTheme.displaySmall?.copyWith(
        //             fontSize: 25,
        //             color: Theme.of(context).colorScheme.surface,
        //           ),
        //     )),
        Positioned(
          right: 0,
          left: 0,
          top: 100,
          child: AssetManager.getPngImageSizedNFilled(
            _images.logo_white.name,
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            height: 150,
          ),
        ),
      ],
    );
  }
}
