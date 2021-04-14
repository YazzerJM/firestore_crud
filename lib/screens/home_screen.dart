// import 'package:firestore_crud/services/basic_crud.dart';
import 'package:firestore_crud/models/constant.dart';
import 'package:firestore_crud/models/movie.dart';
import 'package:firestore_crud/screens/movie_details.dart';
import 'package:firestore_crud/services/movies_service.dart';
import 'package:firestore_crud/widgets/vote_average.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // @override
  // void initState() {

  //   // final basicCrud = BasicCrud();
  //   // basicCrud.addDocument();
  //   // basicCrud.updateDocument();
  //   // basicCrud.deleteDocument();
  //   // basicCrud.fetchDocument();
  //   // basicCrud.fetchAllDocuments();
    
  //   final moviesService = MoviesService();
  //   // moviesService.fetchRestMovie('135');
  //   // moviesService.addAllMovies();

  //   super.initState();
  // }
  // 
  final _moviesService = MoviesService();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _movieTitleController = TextEditingController();
  String _tempMovieTitle;
  bool _isAddMovieIconTapped = false;

  @override
  Widget build(BuildContext context) {

    final movies = Provider.of<List<Movie>>(context);


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(Constant.moviesListTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.add_photo_alternate), 
            onPressed: _addMovie,
          )
        ],
      ),
      body: movies == null
        ? Center(child: CircularProgressIndicator())
        : _buildMoviesList(movies),
    );
  }

  Widget _buildMoviesList(List<Movie> movies){
    if(movies.length == 0){
      return Center(child: Text(Constant.noMoviesMsg));
    }else{
      return ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          final movie = movies[index];
          return Dismissible(
            key: Key(movie.id.toString()),
            background: Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.only(left: 20.0),
              color: Colors.green,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.only(right: 20.0),
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) {
              return _deleteOrUpdateMovie(ctx, direction, movie);
            },
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image.network(
                  Constant.posterImagePrefix + movie.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie.title,
                style: Theme.of(context).textTheme.subtitle2
              ),
              subtitle: Text(
                movie.releaseDate.year.toString(),
                style: TextStyle(color: Colors.white),
              ),
              trailing: VoteAverage(rating: movie.voteAverage),
              onTap: (){
                print(movie.title);
                Navigator.pushNamed(
                  ctx, 
                  MovieDetails.routeName,
                  arguments: movie,
                );
              },
            ),
          );
        }, 
        separatorBuilder: (BuildContext ctx, int index) => Divider(
          color: Colors.white,
          height: 0.1,
        ), 
        itemCount: movies.length);
    }
  }

  Future<bool> _deleteOrUpdateMovie(BuildContext context, DismissDirection direction, Movie movie) async {
    if(direction == DismissDirection.endToStart){
      final deletedMovie = movie;
      final snackBar = SnackBar(
        content: Text(Constant.snackBarMsg),
        action: SnackBarAction(
          label: Constant.undoLabel,
          onPressed: () {
            _moviesService.addFirestoreMovie(deletedMovie);
          },
        ),
      );
      _moviesService.deleteFirestoreMovie(movie.id.toString());
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else if(direction == DismissDirection.startToEnd){
      _movieTitleController.text = movie.title;
      return await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            Constant.editMovieTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
          content: TextField(
            controller: _movieTitleController,
            onChanged: (value){
              setState((){
                _tempMovieTitle = value;
              });
            },
          ),
          actions: [
            FlatButton(
              child: Text(Constant.cancelButtonLeyend),
              onPressed: (){
                Navigator.of(ctx).pop(false);
                _movieTitleController.text = movie.title;
              },
            ),
            FlatButton(
              child: Text(Constant.onButtonLeyend),
              onPressed: (){
                setState((){
                  _moviesService.updateMovieTitle(
                    movie.id.toString(), 
                    _tempMovieTitle
                  );
                });
                Navigator.of(context).pop(false);
              },
            ),
          ],
        ), 
      ) ?? false;
    }

    return Future.value(true);
  }

  Future<void> _addMovie() async {
    if(_isAddMovieIconTapped) {
      return null;
    } else {
      _isAddMovieIconTapped = true;
      await _moviesService.addMovie();
      _isAddMovieIconTapped = false;
    }
  }
}