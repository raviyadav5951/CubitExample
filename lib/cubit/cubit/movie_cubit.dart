import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_cubit/model/movie_model.dart';
import 'package:movies_cubit/repository/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.repository}) : super(InitialState());
  // {
  //   getTrendingMovies();
  // }

  final MovieRepository repository;

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
