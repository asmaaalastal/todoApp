import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/model/tasks_data.dart';
import 'package:todo_app_class/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TasksData>(context).tasks;

    return ListView.builder(
        itemCount: Provider.of<TasksData>(context).tasksCount,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
          );
        });
  }
}
