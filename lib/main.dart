import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/opening-page.dart' as op;
import 'package:firebase_core/firebase_core.dart';
// import 'package:myapp/page-1/sharp-button.dart';
// import 'package:myapp/page-1/mood-page.dart';
// import 'package:myapp/page-1/audio-playing.dart';
// import 'package:myapp/page-1/response.dart';
// import 'package:myapp/page-1/variants.dart';
// import 'package:myapp/page-1/thank-you.dart';
// import 'package:myapp/page-1/form-submitted.dart';
// import 'package:myapp/page-1/back.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure plugins are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Initialize Firebase
  runApp(MyApp()); // Your main application widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: op.Scene(),
        ),
      ),
    );
  }
}
