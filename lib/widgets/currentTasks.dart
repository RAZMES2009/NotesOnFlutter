import 'package:flutter/material.dart';

class CurrentTasks extends StatelessWidget {
  final _allTasksUser;
  final _allTasksUserState;
  final Function _changeValueCheckBox;
  final index;

  CurrentTasks(this._allTasksUser, this._allTasksUserState,
      this._changeValueCheckBox, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.primary,
      child: Row(children: [
        Checkbox(
          checkColor: Colors.lime,
          activeColor: Colors.white,
          value: _allTasksUserState[index],
          onChanged: (bool? value) => _changeValueCheckBox(value, index),
        ),
        Text(
          _allTasksUser[index],
          style: Theme.of(context).textTheme.headline1,
        ),
      ]),
    );
  }
}
