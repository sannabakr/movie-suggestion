import 'package:flutter/material.dart';
import '../widgets/movie_card.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';

class MoviesScreen extends StatelessWidget {
  static const routeName = '/movies-screen';

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movies>(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(49, 73, 60, 1),
        title: Text(
          'Movie Suggestion App',
          style: theme.textTheme.headline1,
        ),
      ),
      body: ListView.builder(
        itemCount: movieData.items.length,
        itemBuilder: (ctx, i) => MovieCard(
          movieData.items[i],
        ),
      ),
    );
  }
}
