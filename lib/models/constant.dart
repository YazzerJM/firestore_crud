import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/models/data_type.dart';

class Constant {

  static const appName = "Firestore CRUD";
  static const movieUrl = 'https://api.themoviedb.org/3/movie/{movieId}?api_key=9535945bf913e7619bcb8b9f622d1392';

  static const movieIds = [
                            '19404',
                            '278',
                            '238',
                            '424',
                            '240',
                            '372058',
                            '496243',
                            '129',
                            '497',
                            '680',
                            '637',
                            '13',
                            '311',
                            '122',
                            '155',
                            '769',
                            '346',
                            '389',
                            '11216',
                            '429',
                            '421658',
                            '593680'
                          ];

  static final movieIdsToAdd = [
                                '13807',
                                '17692',
                                '485774',
                                '11667',
                                '9320',
                                '792'
                              ];
  // Images
  static const imagePrefix = 'https://image.tmdb.org/t/p';
  static const posterImagePrefix = '$imagePrefix/w92';
  static const backdropImagePrefix = '$imagePrefix/w780';
  static const loadingImage = 'assets/no_image.png';

  // UI text
  static const noMoviesMsg = 'There are no movies available';
  static const moviesListTitle = 'Movies List';
  static const snackBarMsg = 'Movie deleted';
  static const undoLabel = 'Undo';
  static const editMovieTitle = 'Edit movie title';
  static const cancelButtonLeyend = 'Cancel';
  static const onButtonLeyend = 'Ok';
  static const movieDetailsTitle = 'Movie details';

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