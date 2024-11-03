class MovieModel {
  final bool adult;
  final int id, votecount;
  // final double popularity, voteaverage;
  final String backdroppath,
      originallanguage,
      originaltitle,
      overview,
      posterpath,
      releasedate,
      title;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdroppath = json['backdrop_path'],
        id = json['id'],
        originallanguage = json['original_language'],
        originaltitle = json['original_title'],
        overview = json['overview'],
        // popularity = json['popularity'],
        posterpath = json['poster_path'],
        releasedate = json['release_date'],
        title = json['title'],
        votecount = json['vote_count'];
  // voteaverage = json['vote_average'];
}
