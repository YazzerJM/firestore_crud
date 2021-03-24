import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/models/data_type.dart';

class Constant {

  static const appName = "Firestore CRUD";

  static final allDataTypes = DataType(
    boolField: false,
    doubleField: 5.6,
    dynamicArrayField: ['1', 2, 3.5],
    geoPointField: GeoPoint(38, -97),
    intArrayField: [1,2,3],
    intField: 10,
    mapField: {'string_field': 'String value', 'int_field': 1},
    nullField: null,
    referenceField: FirebaseFirestore.instance.collection('firestore_collection').doc('documentId_reference'),
    stringField: 'Anything',
    timestampField: Timestamp.fromDate(DateTime.parse('2020-05-08 19:52:23'))
  );
}