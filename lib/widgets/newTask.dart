import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final Function? _addNewTransaction;

  NewTask(this._addNewTransaction);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _textController = TextEditingController();

  void _submitData() {
    if (_textController.text.isEmpty) {
      return;
    }

    final enteredTask = _textController.text;

    widget._addNewTransaction!(enteredTask);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                'Adding new task',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _textController,
                  onSubmitted: (_) => _submitData(),
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Input new task',
                  ),
                ),
              ),
              TextButton(
                  onPressed: _submitData,
                  child: const Text(
                    'Add new task',
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
