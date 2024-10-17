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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo); // 클릭 시 체크 상태 변경
      },
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (bool? value) {
          onTap(todo); // 체크박스 클릭 시 상태 변경 처리
        },
      ), // 체크박스를 맨 앞에 위치시킴
      title: Text(
        todo.title,
        style: TextStyle(
          color: todo.isDone ? Colors.grey : Colors.black,
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        DateFormat.yMMMEd().format(
          DateTime.fromMillisecondsSinceEpoch(todo.dateTime),
        ),
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: todo.isDone
          ? GestureDetector(
        onTap: () {
          onDelete(todo);
        },
        child: const Icon(Icons.delete_forever),
      )
          : null,
    );
  }
}
