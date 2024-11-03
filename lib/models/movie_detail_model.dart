class MovieDetailModel {
  final String posterpath, title, overview;
  final double voteaverage;
  final List<String> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : posterpath = json['poster_path'] ?? '',
        title = json['title'] ?? '',
        overview = json['overview'] ?? '',
        voteaverage = (json['vote_average'] as num?)?.toDouble() ?? 0.0,
        genres = (json['genres'] as List<dynamic>?)
                ?.map((genre) => genre['name'] as String)
                .toList() ??
            [];
}
