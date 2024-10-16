import 'package:flutter/material.dart';
import 'package:todolist/create_screen.dart';
import 'package:todolist/todo.dart';
import 'package:todolist/todo_ltem.dart';

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
        title: const Text('할일 리스트'),
      ),
      body: ListView(
        children: todos.values
            .map((e) => TodoLtem(
              todo : e,
              onTap: (todo) async{
              todo.isDone = !todo.isDone;
              await todo.save();

              setState(() {});
        },
        ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
         await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              const CreateScreen(),
              ),
              );
         setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}