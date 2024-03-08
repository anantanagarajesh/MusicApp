import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // thankyouF6o (156:9)
        padding: EdgeInsets.fromLTRB(29 * fem, 27 * fem, 29 * fem, 419 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff000000),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // group4ADm (161:613)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 271 * fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 29 * fem,
                  height: 29 * fem,
                  child: Image.asset(
                    'assets/page-1/images/group-4.png',
                    width: 29 * fem,
                    height: 29 * fem,
                  ),
                ),
              ),
            ),
            Container(
              // thankyouforlistening44F (161:572)
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 247 * fem,
              ),
              child: Text(
                'THANK YOU FOR LISTENING',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Montserrat',
                  fontSize: 32 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.1000000238 * ffem / fem,
                  letterSpacing: 5.12 * fem,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
