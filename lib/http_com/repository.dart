import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iguesflut_23/http_com/movieModel.dart';

Future<List<MovieModel>> getMovies() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return List<MovieModel>.from(json.map((elemento) {
      return MovieModel.fromJson(elemento);
    }));
  } else {
    return Future.error("Não foi possível carregar os valores");
  }
}
