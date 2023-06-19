class MovieModel {
  String nome;
  String imagem;

  MovieModel({
    required this.nome,
    required this.imagem,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : nome = json['nome'].toString(),
        imagem = json['imagem'].toString();
}
