import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:myapp/models/character.dart';

class CharacterListItem extends HookWidget {
  final Character character;

  const CharacterListItem({ 
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 150,
            child: Image.network(character.image ?? '')
          ),
          SizedBox(width: 25),
          Text(character.name ?? ''),
        ],
      )
    );
  }
}