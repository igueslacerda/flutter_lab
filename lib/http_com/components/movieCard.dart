import 'package:flutter/material.dart';
import 'package:iguesflut_23/http_com/movieModel.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(movie.imagem),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ]),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          movie.nome,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
