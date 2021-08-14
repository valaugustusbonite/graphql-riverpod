import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:myapp/components/main_app_bar.dart';
import 'package:myapp/config/graphql.dart';
import 'package:myapp/models/character.dart';

class HomePage extends StatefulWidget {

  const HomePage({ 
    Key? key 
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character> _characters = [];
  bool _isLoading = false;

  String _getCharacters = r'''
    query Characters {
      characters(page: 1) {
        info {
          count
          pages
          next
          prev
        }
        results {
          id
          name
          image
        }
      }
    }
  ''';

  Future<List<Character>?> getCharacters() async {
    setState(() {
      _isLoading = true;
    });

    final options = QueryOptions(document: gql(_getCharacters));
    final response = await graphQlClient.query(options);

    if (!response.hasException) {
      final List<Object?>  data = response.data!['characters']['results'];
      final values = data.map((e) => Character.fromJson(e as Map<String, dynamic>));

      setState(() {
        _characters = values.toList();
      });

    } else {
      print(response.exception);
    }

    setState(() {
      _isLoading = false;
    });
  }

  _getData() {
    getCharacters();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(),
      body: _isLoading ? LoadingIndicator() : _characters.isEmpty ? Text('No data') : ListView.builder(
        itemCount: _characters.length,
        itemBuilder: (BuildContext context, int index) {
          return CharacterListItem(
            photoUrl: _characters[index].image!,
            name: _characters[index].name,
          );
        }
      ),
    );
  }
}


class CharacterListItem extends StatelessWidget {
  final String? photoUrl;
  final String? name;

  const CharacterListItem({ 
    Key? key,
    this.photoUrl,
    this.name
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
            child: Image.network(photoUrl!)
          ),
          SizedBox(width: 25),
          Text(name!),
        ],
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