import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps/bloc/moviebloc/movie_bloc_event.dart';
import 'package:movie_apps/bloc/moviebloc/movie_bloc_state.dart';
import 'package:movie_apps/model/movie.dart';
import 'package:movie_apps/service/api_service.dart';

// Tendance
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStateToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield MovieLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getTrendingMovies();
      }
      //else {
        //print(movieId);
    //    movieList = await service.getMovieByGenre(movieId);
    //  }

      yield MovieLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieError();
    }
  }
}

// Decouviri
class MovieBlocDecouvrir extends Bloc<MovieEvent, MovieState> {
  MovieBlocDecouvrir() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStateToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield MovieLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getDiscoverMovies();
      }
      //else {
        //print(movieId);
    //    movieList = await service.getMovieByGenre(movieId);
    //  }

      yield MovieLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieError();
    }
  }
}
