import 'package:flutter/material.dart';

class ResponsiveScreen {
  static late double screen_height;
  static late double screen_width;

  static void init(context) {
    screen_height = MediaQuery.of(context).size.height;
    screen_width = MediaQuery.of(context).size.width;
  }
}
