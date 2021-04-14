// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'genre.dart';
import 'movie_collection.dart';
import 'production_country.dart';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
    Movie({
        @required this.id,
        @required this.voteAverage,
        @required this.title,
        @required this.overview,
        @required this.adult,
        @required this.movieCollection,
        @required this.genres,
        @required this.releaseDate,
        @required this.productionCountries,
        @required this.posterPath,
        @required this.backdropPath,
    });

    final int id;
    final double voteAverage;
    final String title;
    final String overview;
    final bool adult;
    final MovieCollection movieCollection;
    final List<Genre> genres;
    final DateTime releaseDate;
    final List<ProductionCountry> productionCountries;
    final String posterPath;
    final String backdropPath;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        overview: json["overview"],
        adult: json["adult"],
        movieCollection: json["belongs_to_collection"] == null ? null :
        MovieCollection.fromJson(json["belongs_to_collection"]),
        genres: List<Genre>.from(json["genres"].map((genre) => Genre.fromJson(genre))),
        releaseDate: DateTime.parse(json["release_date"]),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((country) => ProductionCountry.fromJson(country))),
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vote_average": voteAverage,
        "title": title,
        "overview": overview,
        "adult": adult,
        "movie_collection": movieCollection == null ? null :
        movieCollection.toJson(),
        "genres": List<dynamic>.from(genres.map((genre) => genre.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "production_countries": List<dynamic>.from(productionCountries.map((country) => country.toJson())),
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}

