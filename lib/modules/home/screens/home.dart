import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:myapp/api/characters.graphql.dart';
import 'package:myapp/common/components/main_app_bar.dart';
import 'package:myapp/modules/home/components/character_list_item.dart';
import 'package:myapp/providers/characters_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {

  const HomePage({ 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(false);
    final _charactersProvider = useProvider(charactersProvider);

    _loadData() async {
      _isLoading.value = true;

      try {
        await _charactersProvider.getCharacters();
      } on Exception catch(error) {
        print(error);
      }

      _isLoading.value = false;
    }



  useEffect(() {
    _loadData();

    return;
  }, []);


    return Scaffold(
      appBar: CustomMainAppBar(),
      body: Builder(
        builder: (BuildContext context) {

          if(_isLoading.value) {
            return LoadingIndicator();
          }

          if (!_isLoading.value && _charactersProvider.characters.isEmpty) {
            return Text('No data');
          }

           return ListView.builder(
            itemCount: _charactersProvider.characters.length,
            itemBuilder: (BuildContext context, int index) {
              final character = _charactersProvider.characters[index];

              return CharacterListItem(
                character: character,
              );
            }
          );
        }
      )
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}