import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  List<Pokemon> filteredList = [];
  final Function(String, DetailArguments) onItemTap;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterList);
    widget.filteredList = widget.list;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterList() {
    setState(() {
      widget.filteredList = widget.list
          .where((pokemon) => pokemon.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Pokedex',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                labelText: 'Pesquisar',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: widget.filteredList.length,
                itemBuilder: (context, index) {
                  return PokemonItemWidget(
                    pokemon: widget.filteredList[index],
                    onTap: widget.onItemTap,
                    index: int.parse(widget.filteredList[index].num) - 1,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.transparent,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
