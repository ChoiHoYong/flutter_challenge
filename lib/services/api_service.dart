import 'dart:convert';

import 'package:flutter_challenge/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL = 'https://movies-api.nomadcoders.workers.dev';

  static Future<List<MovieModel>> getBaseMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseURL/popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'];
      final List<dynamic> movies = results;
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
        // print(mv.title);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseURL/now-playing');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'];
      final List<dynamic> movies = results;
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getCSMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseURL/coming-soon');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'];
      final List<dynamic> movies = results;
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }
}
