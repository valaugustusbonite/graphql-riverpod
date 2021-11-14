import 'package:flutter/material.dart';

class TodoInput extends StatelessWidget {
  final TextEditingController textController;

  const TodoInput({ 
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Add an item'
          ),
        ),
      ),
    );
  }
}