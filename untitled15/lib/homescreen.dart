import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled15/authscreen.dart';
import 'package:untitled15/loadimage.dart';

import 'firebase_options.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
/*
 CollectionReference collref = FirebaseFirestore.instance.collection("students");
    collref.add({
      'name':"Ahmed Khan",
      'email' : "abc@gmail.com",
      'mobile': '923333333'

    });

 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? uName ="";
  void signUp() async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "abc1@gmail.com", password: "12345678");
  }
  void loading() async{
    uName = FirebaseAuth.instance.currentUser!.uid.toString();
    DocumentSnapshot df = await FirebaseFirestore.instance.collection("students").doc(uName).get();
    uName = df.get("name").toString();

  }
@override
  void initState(){
    // TODO: implement initState
    super.initState();
loading();

  }
  void _incrementCounter() {
    //writeData1();


    CollectionReference df = FirebaseFirestore.instance.collection("faculty");
    df.add({
      'name':"Farhan Khan",
      'age':'28',
      'subject':'English'
    });


    setState(() {
      //     signUp();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$uName',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
