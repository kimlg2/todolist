import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'todo.dart';

class CreateScreen extends StatefulWidget {
  final Todo? todo; // 수정할 할일을 받는 변수

  const CreateScreen({Key? key, this.todo}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {

      _textController.text = widget.todo!.title;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo == null ? '할일 작성' : '할일 수정'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_textController.text.isNotEmpty) {
                if (widget.todo == null) {

                  await todos.add(
                    Todo(
                      title: _textController.text,
                      dateTime: DateTime.now().millisecondsSinceEpoch,
                    ),
                  );
                } else {

                  widget.todo!.title = _textController.text;
                  await widget.todo!.save();
                }
                if (mounted) {
                  Navigator.pop(context);
                }
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: '할일을 입력하세요.',
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
