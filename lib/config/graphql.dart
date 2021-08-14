

import 'package:graphql/client.dart';
import 'package:myapp/models/character.dart';

final _httpLink = HttpLink('https://rickandmortyapi.com/graphql');

final GraphQLClient graphQlClient = GraphQLClient(
  link: _httpLink,
  cache: GraphQLCache(),
  defaultPolicies: DefaultPolicies(
    query: Policies.safe(
      FetchPolicy.networkOnly,
      ErrorPolicy.none,
      CacheRereadPolicy.mergeOptimistic,
    )
  )
);

class RickMortyQueries {

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
    final options = QueryOptions(document: gql(_getCharacters));
    final response = await graphQlClient.query(options);

    if (!response.hasException) {
      print(response.data!['characters']['results']);
      final List<Object?>  data = response.data!['characters']['results'];
      final values = data.map((e) => Character.fromJson(e as Map<String, dynamic>));

      return values.toList();
    } else {
      print(response.exception);
    }

}




}

