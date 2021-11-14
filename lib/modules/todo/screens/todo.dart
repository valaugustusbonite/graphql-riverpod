import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/common/components/main_app_bar.dart';
import 'package:myapp/modules/profile/screens/profile.dart';
import 'package:myapp/modules/todo/components/todo_input.dart';
import 'package:myapp/modules/todo/components/todo_item.dart';
import 'package:myapp/providers/todo_provider.dart';

List<String> menuItems = [
    'Privacy',
    'Change Password',
    'Delete Account',
  ];

class TodoPage extends HookWidget {
  static const String routeName = '/settings';

  const TodoPage({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _todoProvider = useProvider(todoProvider);
    final _todoTextController = useTextEditingController();

    
    
    return Scaffold(
      appBar: CustomMainAppBar(),
      body: Center(
        child: Container(
          height: double.infinity,
          constraints: const BoxConstraints(maxWidth: 750),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'TO DO',
                    style: TextStyle(
                      fontSize: 32,
                    )
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TodoInput(
                        textController: _todoTextController,
                      ),
                      FloatingActionButton(onPressed: () {
                        _todoProvider.addTodo(body: _todoTextController.text);
                        _todoTextController.clear();
                      }, 
                      child: Icon(Icons.add),)
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final todo = _todoProvider.todos[index];
                    return TodoListItem(
                      todo: todo,
                    );
                  },
                  childCount: _todoProvider.todos.length,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}