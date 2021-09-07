import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final items;
  MovieCard(this.items);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: theme.primaryColorLight,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 10,
            ),
            child: ListTile(
              leading: Image.network(
                'https://image.tmdb.org/t/p/w185_and_h278_bestv2/${items.imageUrl}',
                fit: BoxFit.cover,
              ),
              title: Text(items.name, ),
              subtitle: Text(items.plot),
              trailing: Text(items.imdbRaiting.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
