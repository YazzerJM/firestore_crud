import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/models/constant.dart';

class BasicCrud {
  final _collectionReference = FirebaseFirestore.instance.collection('dart_collection');

  // Add a document to Firestore using the add method
  // Future<DocumentReference> addDocument() async {
  //   return await _collectionReference.add(Constant.allDataTypes.toMap());
  // }

  Future<DocumentReference> addDocument() async {
    await _collectionReference.doc('set_data').set(Constant.allDataTypes.toMap());
  }
}