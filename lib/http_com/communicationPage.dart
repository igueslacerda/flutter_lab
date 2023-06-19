import 'package:flutter/material.dart';
import 'package:iguesflut_23/http_com/components/moviesList.dart';
import 'package:iguesflut_23/http_com/movieModel.dart';
import 'package:iguesflut_23/http_com/repository.dart';

class CommunicationPage extends StatefulWidget {
  const CommunicationPage({Key? key}) : super(key: key);

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  Future<List<MovieModel>>? futureMovies;

  @override
  void initState() {
    futureMovies = futureMovies ?? getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureMovies,
        builder: (context, snapshot) {
          const padding = EdgeInsets.all(25);

          if (snapshot.hasData) {
            final movies = snapshot.data as List<MovieModel>;
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
