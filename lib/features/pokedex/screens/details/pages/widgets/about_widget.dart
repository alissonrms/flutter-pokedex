import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/evolutions_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/rarity_widget.dart';

import '../../../home/pages/widgets/type_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key, required this.pokemon, required this.pokemons})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> pokemons;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RarityWidget(rarity: pokemon.spawnChance),
        const SizedBox(height: 10),
        const Text(
          "Nome",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(pokemon.name),
        const SizedBox(height: 10),
        const Text(
          "Altura",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(pokemon.height),
        const SizedBox(height: 10),
        const Text(
          "Peso",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(pokemon.weight),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: pokemon.baseColor,
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Row(
            children: pokemon.type
                .map((e) => TypeWidget(
                      name: e,
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          pokemon.nextEvolutions.isNotEmpty ? "Evoluções " : '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
