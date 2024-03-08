import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  double _songRating = 0;
  Map<String, dynamic> _responses = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("How would you rate this song?"),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _songRating = rating;
                      _responses['songRating'] = _songRating;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text("What emotions did this song evoke in you?"),
                // Assuming emotions are predefined
                DropdownButton<String>(
                  value: _responses['emotion'],
                  onChanged: (String? newValue) {
                    setState(() {
                      _responses['emotion'] = newValue;
                    });
                  },
                  items: <String>['Happy', 'Sad', 'Excited', 'Reflective']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                    "Did the song uplift your mood or make you feel more reflective?"),
                // For simplicity, using dropdown, but you could use switch or radio buttons
                DropdownButton<String>(
                  value: _responses['moodEffect'],
                  onChanged: (String? newValue) {
                    setState(() {
                      _responses['moodEffect'] = newValue;
                    });
                  },
                  items: <String>['Uplifted', 'Reflective', 'No Change']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text("What was your overall impression of the song?"),
                TextField(
                  onChanged: (text) {
                    _responses['overallImpression'] = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your impression here',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                    "What did you think about the melody/harmony of this song?"),
                TextField(
                  onChanged: (text) {
                    _responses['melodyHarmony'] = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your thoughts here',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _storeFeedback(_responses); // Store feedback in Firestore
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _storeFeedback(Map<String, dynamic> responses) async {
    await FirebaseFirestore.instance.collection('Feedback').add(responses);
  }
}
