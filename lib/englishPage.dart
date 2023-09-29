import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
//import all relevant packages

class EnglishPage extends StatefulWidget {
  @override
  State<EnglishPage> createState() => _EnglishPageState();
}

class _EnglishPageState extends State<EnglishPage> {
  GoogleTranslator translator = GoogleTranslator();
  TextEditingController textController = TextEditingController();
  String translatedText = '';

  //creating instance of Google translator from translator package
  // creating instance of TextEditingController to manage textfield input
  //creating an empty string called translatedText where I put the translated text

  void translate() {
    String inputText = textController.text;
    translator.translate(inputText, to: "en").then((output) {
      setState(() {
        translatedText = output.text;
      });

      //creating a function for the translation. Im creating a inputext
      //where the user can write in the textfield and using translator to translate
      // the input to another language

      final FirebaseFirestore storedb = FirebaseFirestore.instance;
      final data = <String, String>{
        "Original Text": inputText,
        "Translated Text": translatedText,
      };
      storedb.collection("translations").add(data).then((docRef) {
        print("Fungerar");
      }).catchError((error) {
        print("Error");
      });
    });
  }

  //creating a instance of firestore and creating a map of data with the
  //inputs that the user has written

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        title: const Text('English Page'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Text(translatedText),
              SizedBox(height: 30),
              TextFormField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    label: Center(
                      child: Text('Börja skriva för att översätta'),
                    )
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: translate,
                child: Text("Translate"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Adding my textfield for input and text to display the translated words and a button
//Also adding a navigator button to go home