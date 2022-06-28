import 'package:flutter/material.dart';

class RarityWidget extends StatelessWidget {
  const RarityWidget({Key? key, required this.rarity}) : super(key: key);
  final double rarity;

  String _getRarity() {
    if (rarity >= 1) {
      return 'Pokemon Comum';
    }
    if (rarity >= 0.5) {
      return 'Pokemon Incomum';
    }
    if (rarity >= 0.01) {
      return 'Pokemon Raro';
    }
    if (rarity >= 0.001) {
      return 'Pokemon Extremamente Raro';
    }
    return 'Pokemon Lendário';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
            color: rarity >= 1
                ? Colors.black
                : rarity != 0
                    ? Colors.amber[400]
                    : Colors.blue[200],
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            _getRarity(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
