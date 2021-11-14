import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/api/new.graphq.dart';
import 'package:myapp/models/todo.dart';

final todoProvider = ChangeNotifierProvider<TodoNotifier>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends ChangeNotifier {

  List<Todo> _todos = [
    Todo(id: '1', body: 'Todo 1', date: DateTime.now().toString())
  ];
  List<Todo> get todos => _todos;

  //GET DATA FROM API
  //Get list of todos from remote API
  Future<List<Todo>> getTodos() async {
    final data = await getTodos();
    _todos = data;
    return [
      Todo(id: '1', body: 'Todo 1', date: DateTime.now().toString())
    ];
  }

  //ADD NEW DATA FROM API

  Future<void> addTodo({required String body}) async {
    final newTodo = Todo(
      id: (_todos.length + 1).toString(), //uuid
      body: body,
      date: DateTime.now().toString(),
    );
    // final data = await addTodo(); //returns the Todo() object
    // final data = Todo() //returned by the backend,


    _todos = [..._todos, newTodo];
    notifyListeners();
  }
  
  //DELETE DATA FROM API

  Future<void> deleteTodo({required String id}) async {
    //final deleteAPI = await deleteAPI(id); deletes data in the backend

    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

}

// final todoProvider = ChangeNotifierProvider<TodoNotifier>((ref) {
//   return TodoNotifier();
// });

// class TodoNotifier extends ChangeNotifier {
 
//   List<Todo> _todos = [
//     Todo(id: '1', body: 'Todo 1', date: DateTime.now().toString())
//   ];
//   List<Todo> get todos => _todos;

//   void addTodo({required String body}) {

//     final newTodo = Todo(
//       id: (_todos.length + 1).toString(),  
//       body: body, 
//       date: DateTime.now().toString(),
//     );

//     _todos = [..._todos, newTodo];

//     notifyListeners();
//   }

//   void deleteTodo({required String id}) {
//     _todos.removeWhere((todo) => todo.id == id);
//     notifyListeners();
//   }

// }