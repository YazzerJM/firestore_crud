import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/models/constant.dart';
import 'package:firestore_crud/models/data_type.dart';

class BasicCrud {
  final _collectionReference = FirebaseFirestore.instance.collection('dart_collection');

  // Add a document to Firestore using the add method
  // Future<DocumentReference> addDocument() async {
  //   return await _collectionReference.add(Constant.allDataTypes.toMap());
  // }

  Future<DocumentReference> addDocument() async {
    await _collectionReference.doc('set_data').set(Constant.allDataTypes.toMap());
  }

  // Update a document in Firestore using set method
  // Future<void> updateDocument() async {
  //   await _collectionReference.doc('set_data').set({'geo_point_value': GeoPoint(10, 10)});
  // }

  // Update a document but marge the all data, if the field dont exist, that is created. 
  // Future<void> updateDocument() async {
  //   await _collectionReference.doc('qhDtbvRt88dqLcPq47bq').set({'geo_point_field': GeoPoint(20, 20)}, SetOptions(merge: true));
  // }


  // Update a document more than one field using a map.
  // Future<void> updateDocument() async {
  //   await _collectionReference
  //     .doc('qhDtbvRt88dqLcPq47bq')
  //     .update({
  //       'geo_point_field': GeoPoint(40, 40),
  //       'double_field': 7.8
  //     });
  // }

  // Future<void> updateDocument() async {
  //   await _collectionReference.doc('qhDtbvRt88dqLcPq47bq').update({'int_array_field': FieldValue.arrayUnion([5])});
  // }
  
  // Update a document in firestore
  // Replace a non-array value by an array field
  // Future<void> updateDocument() async {
  //   final collecion = _collectionReference.doc('qhDtbvRt88dqLcPq47bq');

  //   await collecion.update({'int_field': FieldValue.arrayUnion(
  //     [GeoPoint(5, 5), GeoPoint(6,6)]
  //   )});
  // }
  
  // Update a docuemnte in firestore
  // Remove a value from an array field
  // Future<void> updateDocument() async {
  //   final collection = _collectionReference.doc('qhDtbvRt88dqLcPq47bq');
    
  //   await collection.update({'dynamic_array_field': FieldValue.arrayRemove([2])});
  // }
  
  // Update a document in firestore
  // Increment a value of a field
  // Future<void> updateDocument() async {
  //   final collection = _collectionReference.doc('qhDtbvRt88dqLcPq47bq');

  //   await collection.update({'double_field': FieldValue.increment(-1.1)});
  // }
  
  // Update a document in firesatore
  // Take the current server timestamp
  // Future<void> updateDocument() async {
  //   final collection = _collectionReference.doc('qhDtbvRt88dqLcPq47bq');

  //   await collection.update({'timestamp_field': FieldValue.serverTimestamp()});
  // }

  // update a document in Firestore
  // If the field don't exist. Firestore creates it.
  Future<void> updateDocument() async {
    final collection = _collectionReference.doc('qhDtbvRt88dqLcPq47bq');

    await collection.update({'yasser': 'jimenez'});
  }

  // Delete a field of a document in Firestore
  // Future<void> deleteDocument() async {
  //   final collection = _collectionReference.doc('qhDtbvRt88dqLcPq47bq');

  //   await collection.update({'int_array_field': FieldValue.delete()});
  // }
  
  // Delete a document in Firestore
  Future<void> deleteDocument() async {
    await _collectionReference.doc('qhDtbvRt88dqLcPq47bq').delete();
  }

  // Fetch a document by its documentID.
  Future<DataType> fetchDocument() async {
    final documentSnapshot = await _collectionReference.doc('qhDtbvRt88dqLcPq47bq').get();

    print(documentSnapshot.data());

    return documentSnapshot.exists ? DataType.fromMap(documentSnapshot.data()) : null;
  }

  // Fetch all documents in a collection
  Future<List<DocumentSnapshot>> fetchAllDocuments() async {
    final querySnapshot = await _collectionReference.get();

    final documents = querySnapshot.docs;

    documents.forEach((document) => print(document.data));
  }
}