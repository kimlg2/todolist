import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/create_screen.dart';
import 'package:todolist/todo.dart';

import 'main.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('할일 목록'),
      ),
      body: ValueListenableBuilder(
        valueListenable: todos.listenable(),
        builder: (context, Box<Todo> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('할일이 없습니다.'),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final todo = box.getAt(index);
              return ListTile(
                leading: Checkbox(
                  value: todo!.isDone,
                  onChanged: (value) {
                    setState(() {
                      todo.isDone = value ?? false;
                      todo.save(); // 완료 여부 저장
                    });
                  },
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    color: todo.isDone ? Colors.grey : Colors.black,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(
                  '작성 시간: ${DateTime.fromMillisecondsSinceEpoch(todo.dateTime)}',
                  style: TextStyle(
                    color: todo.isDone ? Colors.grey : Colors.black,
                  ),
                ),
                trailing: todo.isDone
                    ? IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await todo.delete();
                    setState(() {});
                  },
                )
                    : null,
                onLongPress: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateScreen(todo: todo),
                    ),
                  ).then((_) => setState(() {}));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
