import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/models/todo.dart';
import 'package:myapp/providers/todo_provider.dart';

class TodoListItem extends HookWidget {
  final Todo todo;

  const TodoListItem({ 
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _todoProvider = useProvider(todoProvider);

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.body, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
              Text(todo.date),
            ],
          ),
          IconButton(
            onPressed: () {
              _todoProvider.deleteTodo(id: todo.id);
            }, 
            icon: Icon(Icons.delete),
          )
        ],
      )
    );
  }
}