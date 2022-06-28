import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

import '../../../home/pages/widgets/pokemon_item_widget.dart';

class EvolutionsWidget extends StatelessWidget {
  const EvolutionsWidget(
      {Key? key, required this.evolutions, required this.pokemons})
      : super(key: key);
  final List<Evolution> evolutions;
  final List<Pokemon> pokemons;
  Pokemon _getPokemonByNum(int num) {
    print('testeeeee');
    return pokemons.firstWhere((pokemon) => int.parse(pokemon.num) == num);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 214, left: 24, right: 24),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: evolutions.length,
        itemBuilder: (context, index) {
          return PokemonItemWidget(
            pokemon: _getPokemonByNum(evolutions[index].num),
            onTap: (route, arguments) => {},
            index: evolutions[index].num - 1,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.transparent,
          );
        },
      ),
    );
  }
}

/*
ListView.separated(
      itemCount: evolutions.length,
      itemBuilder: (context, index) {
        return PokemonItemWidget(
          pokemon: _getPokemonByNum(evolutions[index].num),
          onTap: (route, arguments) => {},
          index: evolutions[index].num - 1,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.transparent,
        );
      },
    );
*/
