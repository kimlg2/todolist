import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list 리스트'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('title 1'),
            subtitle: Text('subtitle 1'),
          ),
          ListTile(
            title: Text('title 2'),
            subtitle: Text('subtitle 2'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
    );
  }
}