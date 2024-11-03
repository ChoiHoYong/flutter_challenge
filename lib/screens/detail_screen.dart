import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/movie_detail_model.dart';
import 'package:flutter_challenge/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String title, posterpath;
  final String overview;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.posterpath,
    required this.overview,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${widget.posterpath}'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(widget.title),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: movie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(
                      snapshot.data!.voteaverage.toStringAsFixed(1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(snapshot.data!.genres.join(', ')),
                  ],
                );
              }
              return const Text('...');
            },
          )
        ],
      ),
    );
  }
}
