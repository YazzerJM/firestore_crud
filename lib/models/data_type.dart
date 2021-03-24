import 'package:cloud_firestore/cloud_firestore.dart';

class DataType {
  
  bool boolField;
  double doubleField;
  List<dynamic> dynamicArrayField;
  GeoPoint geoPointField;
  List<int> intArrayField;
  int intField;
  Map mapField;
  String nullField;
  DocumentReference referenceField;
  String stringField;
  Timestamp timestampField;

  DataType({
    this.boolField,
    this.doubleField,
    this.dynamicArrayField,
    this.geoPointField,
    this.intArrayField,
    this.intField,
    this.mapField,
    this.nullField,
    this.referenceField,
    this.stringField,
    this.timestampField
  });

  factory DataType.fromMap(Map<String, dynamic> map) => DataType(
    boolField: map['bool_field'],
    doubleField: map['double_field'],
    dynamicArrayField: map['dynamic_array_field'],
    geoPointField: map['geo_point_field'],
    intArrayField: map['int_array_field'],
    intField: map['int_field'],
    mapField: map['map_field'],
    nullField: map['null_field'],
    referenceField: map['reference_field'],
    stringField: map['string_field'],
    timestampField: map['timestamp_field'],
  );

  Map<String, dynamic> toMap() => {
    'bool_field': boolField,
    'double_field': doubleField,
    'dynamic_array_field': dynamicArrayField,
    'geo_point_field': geoPointField,
    'int_array_field': intArrayField,
    'int_field': intField,
    'map_field': mapField,
    'null_field': nullField,
    'reference_field': referenceField,
    'string_field': stringField,
    'timestamp_field': timestampField
  };

}