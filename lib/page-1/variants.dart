import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 40;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // variantsoq9 (160:543)
        padding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 10 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x33853ef9)),
          borderRadius: BorderRadius.circular(5 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              // property1starudH (160:537)
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 20 * fem,
                height: 20 * fem,
                child: Image.asset(
                  'assets/page-1/images/property-1star.png',
                  width: 20 * fem,
                  height: 20 * fem,
                ),
              ),
            ),
            SizedBox(
              height: 6 * fem,
            ),
            Container(
              // property1starhoverQK9 (160:539)
              width: 20 * fem,
              height: 20 * fem,
              child: Image.asset(
                'assets/page-1/images/property-1star-hover.png',
                width: 20 * fem,
                height: 20 * fem,
              ),
            ),
            SizedBox(
              height: 6 * fem,
            ),
            TextButton(
              // property1staractivev2b (160:541)
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 20 * fem,
                height: 20 * fem,
                child: Image.asset(
                  'assets/page-1/images/property-1star-active.png',
                  width: 20 * fem,
                  height: 20 * fem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
