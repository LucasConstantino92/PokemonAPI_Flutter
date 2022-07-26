import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/commons/repositories/pokemon_repository.dart';
import 'package:pokemon_api/features/pokedex/route.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
