import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import all relevant packages

final FirebaseFirestore storedb = FirebaseFirestore.instance;
//creating an instance of firestore

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[900],

      appBar: AppBar(
        title: const Text('History Page'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(

              constraints: BoxConstraints(
                maxHeight: 600
              ),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('translations').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                      return Center(
                        child: Column(children: [
                          SizedBox(height: 15),
                          Text("Original Text: " + document['Original Text']),
                          Text("Translated Text: " + document['Translated Text']),
                        ]),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child:     ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go home'),
                ),
              ),

            ),
          ],

        ),
      ),
    );
  }
}
//creating a streambuilder that listens to my firestore translation collection and updates
//my page with a list of my data as text if it finds it.
//if there is no data I will show a circular progress indicator while data is loading
