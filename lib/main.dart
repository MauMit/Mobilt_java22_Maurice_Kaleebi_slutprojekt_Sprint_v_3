import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slutprojecttest1/englishPage.dart';
import 'package:slutprojecttest1/spanishPage.dart';
import 'package:slutprojecttest1/estonianPage.dart';
import 'package:slutprojecttest1/history.dart';
import 'firebase_options.dart';

//importing all the relevant packages

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initilizing firebase

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/EnglishPage': (context) => EnglishPage(),
      '/SpanishPage': (context) => SpanishPage(),
      '/EstonianPage': (context) => EstonianPage(),
      '/HistoryPage': (context) => HistoryPage(),
    },
  ));
}

//creating routes to all my dart files

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EnglishPage');
              },
              child: Text('Go to English Translation'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SpanishPage');
              },
              child: Text('Go to Spanish Translation'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EstonianPage');
              },
              child: Text('Go to Estonian Translation'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HistoryPage');
              },
              child: Text('Go to Translation History'),
            ),
          ),
        ],
      ),
    );
  }
}



//creating an App bar for my homepage and adding buttons to my different dart files