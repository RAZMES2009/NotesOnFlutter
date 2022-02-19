import 'package:flutter/material.dart';

class DoneTasks extends StatelessWidget {
  final _allTasksUser;
  final _allTasksUserState;
  final Function _changeValueCheckBox;
  final VoidCallback _deleteAllTasks;

  DoneTasks(this._allTasksUser, this._allTasksUserState,
      this._changeValueCheckBox, this._deleteAllTasks);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 52),
              child: Text(
                'Complete tasks',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            IconButton(
                onPressed: _deleteAllTasks,
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ))
          ],
        ),
        const SizedBox(height: 20),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _allTasksUserState.length,
            itemBuilder: (ctx, index) {
              return _allTasksUserState[index] == true
                  ? Card(
                      elevation: 2,
                      color: Theme.of(context).colorScheme.primary,
                      child: Row(children: [
                        Checkbox(
                          checkColor: Colors.lime,
                          activeColor: Colors.white,
                          value: _allTasksUserState[index],
                          onChanged: (bool? value) =>
                              _changeValueCheckBox(value, index),
                        ),
                        Text(
                          _allTasksUser[index],
                          style: Theme.of(context).textTheme.overline,
                        ),
                      ]),
                    )
                  : const SizedBox();
            }),
      ],
    );
  }
}
