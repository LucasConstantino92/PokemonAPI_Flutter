import 'package:flutter/material.dart';
import 'package:pokemon_api/commons/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({
    Key? key,
    required this.isDiff,
    required this.pokemon,
  }) : super(key: key);

  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: isDiff ? 0.4 : 1.0,
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            tween: Tween<double>(
                end: isDiff ? 100 : 350, begin: isDiff ? 350 : 100),
            builder: (context, value, child) {
              return Image.network(
                width: value,
                fit: BoxFit.contain,
                pokemon.image,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
