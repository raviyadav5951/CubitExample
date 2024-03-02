import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_cubit/cubit/cubit/movie_cubit.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    context.read<MovieCubit>().getTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies List',
        ),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is ErrorState) {
          return const Center(
            child: Icon(Icons.close),
          );
        } else if (state is LoadedState) {
          final movies = state.movies;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(movies[index].title ?? ''),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${movies[index].posterPath}"),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
