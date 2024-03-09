import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/page-1/response.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        orElse: () => const MapEntry('Not Sure 🤷', false));

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Your Mood"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[
              Color.fromARGB(255, 1, 94, 32),
              Color.fromARGB(255, 45, 189, 86)
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
                  return Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors
                          .white, // Color for the checkbox when it's not selected
                      checkboxTheme: CheckboxThemeData(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors
                                .blue; // Color of the checkbox when it is selected
                          }
                          return Colors.white; // Default color
                        }),
                        checkColor: MaterialStateProperty.all(
                            Colors.white), // Color of the tick
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        // To change the size, you might need to create a custom checkbox widget
                      ),
                    ),
                    child: CheckboxListTile(
                      title: Text(key,
                          style: const TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 20, // Adjust the size as per your need
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255,
                                255), // Adjust the color as per your need
                          )),
                      value: moods[key],
                      onChanged: (bool? value) {
                        setState(() {
                          // Ensure single selection
                          moods[key] = value!;
                        });
                      },
                      // Customizing checkbox size directly isn't supported, so for a bigger checkbox, consider using a custom implementation or adjusting surrounding elements to match.
                      // The checkColor and fillColor in the theme will adjust the tick color and checkbox color.
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: _submitMood,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text Color (Foreground color)
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
