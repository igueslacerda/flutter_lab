import 'package:flutter/material.dart';
import 'package:iguesflut_23/http_com/components/moviesList.dart';
import 'package:iguesflut_23/http_com/movieModel.dart';
import 'package:iguesflut_23/http_com/repository.dart';
import 'package:provider/provider.dart';

import '../appState.dart';

class CommunicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var movies = appState.movies;

    if (movies != null && movies.isNotEmpty) {
      return MoviesList(movies: movies);
    }
    return FutureBuilder(
        future: getMovies(),
        builder: (context, snapshot) {
          const padding = EdgeInsets.all(25);

          if (snapshot.hasData) {
            var movies = snapshot.data as List<MovieModel>;
            appState.movies = movies;
            return MoviesList(movies: movies);
          } else if (snapshot.hasError) {
            return Padding(
              padding: padding,
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }
          return const Padding(
            padding: padding,
            child: CircularProgressIndicator(),
          );
        });
  }
}
