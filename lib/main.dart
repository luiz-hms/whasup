import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whasup/firebase_options.dart';
import 'package:whasup/pages/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  /*FirebaseFirestore.instance
      .collection('usuarios')
      .doc('001')
      .set({"nome": "luiz"});
  */
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075E54),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
