import 'package:flutter/material.dart';

import './widgets/newTask.dart';
import './widgets/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _allTasksUser = [];
  List _allTasksUserState = [];

  void _addNewTransaction(String value) {
    setState(() {
      _allTasksUser.add(value);
      _allTasksUserState.add(false);
    });
  }

  void _startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTask(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.green,
            secondary: Colors.purple,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal),
            headline2: TextStyle(
                color: Colors.grey, fontSize: 20, fontStyle: FontStyle.italic),
            overline: TextStyle(
                fontSize: 18,
                color: Colors.white,
                decoration: TextDecoration.lineThrough),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My tasks',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Tasks(_allTasksUser, _allTasksUserState),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _startAddNewTask(context),
          ),
        ),
      ),
    );
  }
}
