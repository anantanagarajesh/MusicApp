import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/mood-page.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // openingpageGVV (156:4)
        padding: EdgeInsets.fromLTRB(89 * fem, 186 * fem, 89 * fem, 126 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              Color.fromARGB(255, 0, 56, 19),
              Color.fromARGB(255, 45, 189, 86)
            ],
            stops: <double>[0.511, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // musikoMYs (156:10)

              child: Text(
                'MUSIKO',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Lexend',
                  fontSize: 35 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.25 * ffem / fem,
                  color: Color(0xffffffff),
                  letterSpacing: 2 * fem,
                ),
              ),
            ),
            Container(
              // openingphoto1aAj (157:16)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 78 * fem),
              width: 264 * fem,
              height: 264 * fem,
              child: Image.asset(
                'assets/page-1/images/opening-photo-1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // sharpbuttonTkK (157:26)
              margin: EdgeInsets.fromLTRB(32 * fem, 0 * fem, 31 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoodPage()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 51 * fem,
                  child: Container(
                    // buttonY15 (I157:26;157:19)
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 163, 249, 116),
                    ),
                    child: Center(
                      child: Text(
                        'GET STARTED',
                        style: SafeGoogleFont(
                          'Lexend',
                          fontSize: 10 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1 * ffem / fem,
                          letterSpacing: 1.6 * fem,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
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
