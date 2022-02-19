import 'package:flutter/material.dart';

import './currentTasks.dart';
import './doneTasks.dart';

class Tasks extends StatefulWidget {
  final List _allTasksUser;
  final List _allTasksUserState;

  Tasks(this._allTasksUser, this._allTasksUserState);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void _changeValueCheckBox(bool? value, var index) {
    setState(() {
      widget._allTasksUserState[index] = value!;
    });
  }

  void _completeAllTasks() {
    setState(() {
      for (var i = 0; i < widget._allTasksUserState.length; i++) {
        widget._allTasksUserState[i] = true;
      }
    });
  }

  void _deleteAllTasks() {
    setState(() {
      for (var i = widget._allTasksUserState.length - 1; i >= 0; i--) {
        if (widget._allTasksUserState[i] == true) {
          widget._allTasksUserState.removeAt(i);
          widget._allTasksUser.removeAt(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 52),
                  child: Text(
                    'Current tasks',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                IconButton(
                    onPressed: _completeAllTasks,
                    icon: Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.error,
                    ))
              ],
            ),
            SizedBox(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget._allTasksUserState.length,
                      itemBuilder: (ctx, index) {
                        return widget._allTasksUserState[index] == false
                            ? CurrentTasks(
                                widget._allTasksUser,
                                widget._allTasksUserState,
                                _changeValueCheckBox,
                                index)
                            : const SizedBox();
                      }),
                  DoneTasks(widget._allTasksUser, widget._allTasksUserState,
                      _changeValueCheckBox, _deleteAllTasks),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
