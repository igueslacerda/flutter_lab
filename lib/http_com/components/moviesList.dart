import 'package:flutter/material.dart';
import 'package:iguesflut_23/http_com/components/movieCard.dart';
import 'package:iguesflut_23/http_com/movieModel.dart';

class MoviesList extends StatelessWidget {
  final List<MovieModel> movies;

  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: movies.length,
        itemBuilder: ((context, index) {
          final movie = movies[index];
          return MovieCard(movie: movie);
        }),
        physics: ScrollPhysics());
  }
}
