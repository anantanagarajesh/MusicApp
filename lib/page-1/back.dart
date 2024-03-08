import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 24.9890003204;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // backwUj (161:591)
        width: double.infinity,
        height: 25*fem,
        child: Image.asset(
          'assets/page-1/images/back.png',
          width: 24.99*fem,
          height: 25*fem,
        ),
      ),
          );
  }
}