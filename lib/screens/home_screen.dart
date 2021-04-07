import 'package:firestore_crud/services/basic_crud.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    final basicCrud = BasicCrud();
    // basicCrud.addDocument();
    // basicCrud.updateDocument();
    // basicCrud.deleteDocument();
    // basicCrud.fetchDocument();
    basicCrud.fetchAllDocuments();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}