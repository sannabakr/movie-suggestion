import 'package:flutter/foundation.dart';





class Movie {
  final String name;
  final List<dynamic> genres;
  final  imdbRaiting;
  final String plot;
  final  imdbId;
  final String imageUrl;


  const Movie({
    @required this.plot,
    @required this.name,
    @required this.genres,
    @required this.imdbRaiting,
    @required this.imdbId,
    @required this.imageUrl,
  });
  
}
