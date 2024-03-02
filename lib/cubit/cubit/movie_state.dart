part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {}

class InitialState extends MovieState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends MovieState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends MovieState {
  LoadedState(this.movies);
  final List<Results> movies;

  @override
  List<Object> get props => [movies];
}

class ErrorState extends MovieState {
  @override
  List<Object> get props => [];
}
