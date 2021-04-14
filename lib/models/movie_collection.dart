import 'package:meta/meta.dart';

class MovieCollection {
    MovieCollection({
        @required this.id,
        @required this.name,
        @required this.posterPath,
        @required this.backdropPath,
    });

    final int id;
    final String name;
    final String posterPath;
    final String backdropPath;

    factory MovieCollection.fromJson(Map<String, dynamic> json) => MovieCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}