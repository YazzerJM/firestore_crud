import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VoteAverage extends StatelessWidget {
  
  final double rating;
  const VoteAverage({@required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating / 2,
      itemBuilder: (ctx, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemSize: 20.0,
      unratedColor: Colors.amber.withAlpha(50),
    );
  }
}