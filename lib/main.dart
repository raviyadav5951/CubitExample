import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_cubit/cubit/cubit/movie_cubit.dart';
import 'package:movies_cubit/repository/movie_repository.dart';
import 'package:movies_cubit/ui/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<MovieCubit>(
        create: (context) => MovieCubit(
          repository: MovieRepository(
            Dio(),
          ),
        ),
        child: const MoviePage(),
      ),
    );
  }
}
