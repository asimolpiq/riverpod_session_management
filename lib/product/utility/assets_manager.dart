import 'package:flutter/material.dart';

class AssetManager {
  static Image getPngImage(
    String name, {
    Alignment alignment = Alignment.center,
  }) {
    return Image.asset(
      "assets/$name.png",
      alignment: alignment,
    );
  }

  static Image getPngImageSizedNFilled(
    String name, {
    Alignment alignment = Alignment.center,
    BoxFit fit = BoxFit.fill,
    double height = 100,
    double width = 200,
  }) {
    return Image.asset(
      "assets/$name.png",
      fit: fit,
      alignment: alignment,
      height: height,
      width: width,
    );
  }
}
