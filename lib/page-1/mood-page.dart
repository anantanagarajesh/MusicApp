import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/page-1/response.dart';
import 'package:myapp/page-1/thank-you.dart';

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  Map<String, bool> moods = {
    'Happy 😊': false,
    'Sad 😢': false,
    'Angry 😠': false,
    'Excited 🤩': false,
    'Hurt 💔': false,
    'Confused 😕': false,
    'Not Sure 🤷': false,
  };

  void _submitMood() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final selectedMood = moods.entries.firstWhere(
        (element) => element.value == true,
        orElse: () => MapEntry('Not Sure 🤷', false));

    // Using Firestore to store the selected mood
    firestore.collection('Moods').add({
      'mood': selectedMood.key,
      'timestamp':
          FieldValue.serverTimestamp(), // Use server timestamp for consistency
    }).then((_) {
      // Navigate to the next page after submitting
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FeedbackPage())); // Ensure NextPage is defined
    }).catchError((error) {
      print("Error saving mood to Firestore: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Mood"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              Color.fromARGB(255, 6, 74, 29),
              Color.fromARGB(255, 45, 189, 86),
            ],
            stops: <double>[0.511, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: moods.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key,
                        style: SafeGoogleFont(
                          'Lexend',
                          fontSize: 20, // Adjust the size as per your need
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255,
                              255), // Adjust the color as per your need
                        )),
                    value: moods[key],
                    onChanged: (bool? value) {
                      setState(() {
                        // Ensure single selection
                        moods[key] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: _submitMood,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text Color (Foreground color)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
