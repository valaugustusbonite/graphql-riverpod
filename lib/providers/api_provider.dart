
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/api/characters.graphql.dart';
import 'package:myapp/api/new.graphq.dart';

final apiProvider = Provider<ApiProvider>((ref) => ApiProvider());

class ApiProvider {
  final characters = CharactersGraphQL();
}