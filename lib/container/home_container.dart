import 'package:flutter/material.dart';
import 'package:pokemon_api/commons/error/failure.dart';
import 'package:pokemon_api/commons/repositories/pokemon_repository.dart';
import 'package:pokemon_api/features/container/detail_container.dart';
import 'package:pokemon_api/pages/home_error.dart';
import 'package:pokemon_api/pages/home_loading.dart';
import 'package:pokemon_api/pages/home_page.dart';

import '../commons/models/pokemon.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  final IPokemonsRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!, onItemTap: onItemTap,);
          }
          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }
          return Container();
        });
  }
}
