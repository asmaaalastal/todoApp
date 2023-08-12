import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/model/tasks_data.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Provider.of<TasksData>(context, listen: false).delete(task);
      },
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: MyCheckbox(
        isChecked: task.isDone,
        func: (bool? value) {
          Provider.of<TasksData>(context, listen: false).toggle(task);
        },
      ),
    );
  }
}

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({
    Key? key,
    required this.isChecked,
    this.func,
  }) : super(key: key);

  final bool isChecked;
  final Function(bool?)? func;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: func,
    );
  }
}
