import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 352;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // sharpbuttonz3R (157:25)
        padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 16 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5 * fem),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // hoverfalseVks (157:21)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 16 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 152 * fem,
                  height: 51 * fem,
                  child: Container(
                    // buttonBNo (157:19)
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                    ),
                    child: Center(
                      child: Text(
                        'GET STARTED',
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 10 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1 * ffem / fem,
                          letterSpacing: 1.6 * fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // hovertrueSZd (157:22)
              width: 152 * fem,
              height: 51 * fem,
              child: Container(
                // buttonPDy (157:23)
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xb2000000),
                ),
                child: Center(
                  child: Text(
                    'GET STARTED',
                    style: SafeGoogleFont(
                      'Montserrat',
                      fontSize: 10 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.1 * ffem / fem,
                      letterSpacing: 1.6 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
