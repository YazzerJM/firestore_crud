import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:firestore_crud/models/constant.dart';

class MoviesService {

  final _db = FirebaseFirestore.instance;

  // Fetch a movie from TMDB REST
  Future<Movie> fetchRestMovie(String movieId) async {
    final String url = Constant.movieUrl.replaceFirst('{movieId}', movieId);

    var movie;

    await http.get(url).then((response){
      movie = movieFromJson(response.body);
    });

    print('### ${movie.title}');

    return movie;
  }

  // Add a movie to Firestore
  Future<void> addFirestoreMovie(Movie movie) async {
    _db.collection('movies').doc(movie.id.toString())
    .set(movie.toJson());
  }

  // Add all movies from the movieIds array
  Future<List<Movie>> addAllMovies() async {
    final movies = <Movie>[];
    for(String movieId in Constant.movieIds){
      final movie = await fetchRestMovie(movieId);
      movies.add(movie);
      await addFirestoreMovie(movie);
    }

    return movies;
  }

  // Get all movies saved in Firestore as Stream
  // to use them with StreamProvider
  Stream<List<Movie>>fetchAllMovies() {
    final movies = _db.collection('movies')
    .orderBy('release_date', descending: true)
    .snapshots()
    .map((querySnapshot) => querySnapshot.docs
    .map((documentSnapshot) => Movie.fromJson(documentSnapshot.data())).toList());

    return movies;
  }

  // Delete a movie from Firestore
  Future<void> deleteFirestoreMovie(String movieId) async {
    return _db.collection('movies').doc(movieId).delete();
  }

  // Update in firestore the movie's title
  Future<void> updateMovieTitle(String movieId, String movieTitle) async {
    return await _db.collection('movies').doc(movieId).update({'title': movieTitle});
  }

  // Add a movie from the movieIdsToAdd array to Firestore
  Future<void> addMovie() async {
    if(Constant.movieIdsToAdd.length > 0){
      final movie = await fetchRestMovie(Constant.movieIdsToAdd[0]);
      await addFirestoreMovie(movie);
      Constant.movieIdsToAdd.removeAt(0);
    } else {
      print('There are no movies to add');
    }
  }
}