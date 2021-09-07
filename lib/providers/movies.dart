import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'movie.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Movies with ChangeNotifier {
  List<Movie> _items = [];

  List<Movie> get items {
    return [..._items];
  }

   int _genre;
   int _raiting;

  Function convertGenresToInt(String value) {
    switch (value) {
      case 'Action':
        _genre = 28;
        break;
      case 'Animation':
        _genre = 16;
        break;
      case 'Comedy':
        _genre = 35;
        break;
      case 'Adventure':
        _genre = 12;
        break;
      case 'Crime':
        _genre = 80;
        break;
      case 'Documentary':
        _genre = 99;
        break;
      case 'Drama':
        _genre = 18;
        break;
      case 'Family':
        _genre = 10751;
        break;

      case 'Fantasy':
        _genre = 14;
        break;
      case 'History':
        _genre = 36;
        break;
      case 'Horror':
        _genre = 27;
        break;
      case 'Music':
        _genre = 10402;
        break;
      case 'Mystery':
        _genre = 9648;
        break;
      case 'Romance':
        _genre = 10749;
        break;
      case 'Science Fiction':
        _genre = 878;
        break;
      case 'TV Movie':
        _genre = 10770;
        break;
      case 'Thriller':
        _genre = 53;
        break;
      case 'War':
        _genre = 10752;
        break;
      case 'Western':
        _genre = 37;
        break;
      default:
        _genre = null;
        break;
    }
  }

  void convertRaitingToInt(String raiting) {
    switch (raiting) {
      case '1+':
        _raiting = 1;
        break;
      case '2+':
        _raiting = 2;
        break;
      case '3+':
        _raiting = 3;
        break;
      case '4+':
        _raiting = 4;
        break;
      case '5+':
        _raiting = 5;
        break;
      case '6+':
        _raiting = 6;
        break;
      case '7+':
        _raiting = 7;
        break;
      case '8+':
        _raiting = 8;
        break;
      case '9+':
        _raiting = 9;
        break;
      default:
        _raiting = null;
        break;
    }
  }

  Future<void> searchForMovie(bool fromBool, int _year) async {
    //String genre = _genre.toString();
    var url;
    var genre = '&with_genres=$_genre';
    var  raiting= '&vote_average.gte=$_raiting';
    var year;
    try {
      if (fromBool) {
        year = '&release_date.gte=$_year';
        url =
            'https://api.themoviedb.org/3/discover/movie?api_key=0036dd1e9a10b118a50fc9598f036fac&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1$year$raiting$genre&with_watch_monetization_types=flatrate';
      } else {
        year = '&release_date.lte=$_year';
         url =
            'https://api.themoviedb.org/3/discover/movie?api_key=0036dd1e9a10b118a50fc9598f036fac&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1$year$raiting$genre&with_watch_monetization_types=flatrate';
      }
      final response = await http.get(Uri.parse(url));

      final extractedData = await jsonDecode(response.body);
      final result = await extractedData['results'];
      final List<Movie> loadedMovies = [];
      result.forEach((data) {
        loadedMovies.add(Movie(
          plot: data['overview'],
          name: data['title'],
          genres:data['genre_ids'],
          imdbRaiting: data['vote_average'],
          imdbId: data['id'],
          imageUrl: data['poster_path'],
        ));
      });
      _items = loadedMovies;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
