import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_api/commons/consts/api_consts.dart';
import 'package:pokemon_api/commons/error/failure.dart';

import '../models/pokemon.dart';


abstract class IPokemonsRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonsRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon']as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();

    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}
