import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo.dart';

class TodoLtem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;

  const TodoLtem({
    Key? key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
    }) :
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:() {
        onTap(todo);
      },
      leading: todo.isDone
        ? const Icon(Icons.check_circle, color: Colors.blueAccent)
        : const Icon(Icons.check_circle_outline),
      title: Text(
          todo.title,
          style: TextStyle(color:  todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
          DateFormat.yMMMEd().
          format(DateTime.
          fromMillisecondsSinceEpoch(todo.dateTime)),
        style: TextStyle(color:  todo.isDone ? Colors.grey : Colors.black),
      ),
        trailing:todo.isDone ?
        GestureDetector(
          onTap: () {
            onDelete(todo);
          },
          child: const Icon(Icons.delete_forever),
        )
        : null,
    );
  }
}
