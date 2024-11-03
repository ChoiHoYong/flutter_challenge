import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String posterpath, title;
  final int id;
  final String overview;

  const Movie({
    super.key,
    required this.id,
    required this.posterpath,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              posterpath: posterpath,
              overview: overview,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network('https://image.tmdb.org/t/p/w500/$posterpath'),
          ),
        ],
      ),
    );
  }
}
