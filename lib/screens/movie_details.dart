import 'package:firestore_crud/models/constant.dart';
import 'package:firestore_crud/models/movie.dart';
import 'package:firestore_crud/widgets/vote_average.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {

  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {

    final movie = ModalRoute.of(context).settings.arguments as Movie;
    const defaultSpacing = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.movieDetailsTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: Constant.loadingImage, 
                  image: Constant.backdropImagePrefix + movie.backdropPath
                ),
                Positioned(
                  bottom: defaultSpacing,
                  left: defaultSpacing,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headline6
                      ),
                      Row(
                        children: [
                          Text(
                            movie.releaseDate.year.toString(),
                            style: Theme.of(context).textTheme.subtitle2
                          ),
                          SizedBox(width: defaultSpacing),
                          VoteAverage(rating: movie.voteAverage)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(defaultSpacing),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.network(
                      Constant.posterImagePrefix + movie.posterPath,
                      fit: BoxFit.cover,
                    )
                  ),
                  SizedBox(width: defaultSpacing),
                  Expanded(
                    child: Text(
                      movie.overview,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}