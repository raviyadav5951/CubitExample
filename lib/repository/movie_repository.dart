import 'package:dio/dio.dart';
import 'package:movies_cubit/model/movie_model.dart';

class MovieRepository {
  const MovieRepository(this.client);

  final Dio client;

  Future<List<Results>> getMovies() async {
    try {
      const url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      final response = await client.get(url);

      List<Results> movies = [];
      if (response.statusCode == 200) {
        //way 1
        // movies = List<Results>.of(
        //   response.data['results']?.map<Results>(
        //     (result) => Results.fromJson(result)

        //     //way 2

        //     // Results(
        //     //   title: result['title'],
        //     //   posterPath:
        //     //       'https://image.tmdb.org/t/p/w185${result['poster_path']}',
        //     // ),

        //   ),
        // );

        movies = response.data['results']
            ?.map<Results>((json) => Results.fromJson(json))
            .toList();
      }

      return movies;
    } catch (e) {
      throw e;
    }
  }
}
