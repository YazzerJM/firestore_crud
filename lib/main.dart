import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_crud/models/constant.dart';
import 'package:firestore_crud/screens/home_screen.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.appName,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: HomeScreen()
    );
  }
}