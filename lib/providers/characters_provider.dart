import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/api/characters.graphql.dart';
import 'package:myapp/models/character.dart';
import 'package:myapp/providers/api_provider.dart';

final charactersProvider = ChangeNotifierProvider(
  
  (ref) {
  final charactersGraphQL = ref.watch(apiProvider).characters;

  return CharactersNotifier(charactersAPI: charactersGraphQL);
}



);

class CharactersNotifier extends ChangeNotifier {
  final CharactersGraphQL charactersAPI;

  CharactersNotifier({
    required this.charactersAPI,
  });


  List<Character> _characters = [];
  List<Character> get characters => _characters;

  Future<List<Character>> getCharacters() async {
    final data = await charactersAPI.getCharacters(); // List<Characters>

    _characters = data;
    return _characters;
  }

}

// final charactersProvider = ChangeNotifierProvider<CharactersNotifier>((ref) {
//   final charactersGraphQL = ref.watch(apiProvider).characters;

//   return CharactersNotifier(charactersAPI: charactersGraphQL);
// });

// class CharactersNotifier extends ChangeNotifier {
//   final CharactersGraphQL charactersAPI;

//   CharactersNotifier({
//     required this.charactersAPI,
//   });

//   List<Character> _characters = [];
//   List<Character> get characters => _characters;

//   Future<List<Character>> getCharacters() async {
//     final data = await charactersAPI.getCharacters();

//     _characters = data;
//     return _characters;
//   } 

// }