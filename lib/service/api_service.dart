

import 'package:dio/dio.dart';
import 'package:movie_apps/model/movie.dart';
import 'package:movie_apps/model/movie_image.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '061e411e417766bfc7b370d08d2fbd49';
  final String language = 'fr';

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final url = '$baseUrl/trending/movie/day?api_key=$apiKey&language=$language';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getDiscoverMovies() async {
    try {
      final url = '$baseUrl/discover/movie?api_key=$apiKey&language=$language';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getYoutubeId(int id) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$id/videos?$apiKey');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<MovieImage> getMovieImage(int movieId) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$movieId/images?$apiKey');
      return MovieImage.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }


}
