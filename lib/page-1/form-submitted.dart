import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 307;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // formsubmittedBwV (159:207)
        padding: EdgeInsets.fromLTRB(0 * fem, 70.5 * fem, 0 * fem, 70.5 * fem),
        width: double.infinity,
        height: 325 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Container(
          // frame7aF (159:208)
          padding:
              EdgeInsets.fromLTRB(30 * fem, 30.5 * fem, 29 * fem, 29 * fem),
          width: 361 * fem,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // frame2hD (159:209)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 10.5 * fem),
                width: 64 * fem,
                height: 64 * fem,
                child: Image.asset(
                  'assets/page-1/images/frame.png',
                  width: 64 * fem,
                  height: 64 * fem,
                ),
              ),
              Container(
                // thankyou9G3 (159:215)
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 9 * fem),
                child: Text(
                  'Thank you!',
                  style: SafeGoogleFont(
                    'Work Sans',
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.1725 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Text(
                // yourformhasbeensuccessfullysub (159:216)
                'Your form has been successfully submitted.',
                style: SafeGoogleFont(
                  'Work Sans',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.1725 * ffem / fem,
                  color: Color(0x7f000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
