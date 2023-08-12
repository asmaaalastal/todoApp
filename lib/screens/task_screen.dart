import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_class/widgets/tasks_list.dart';

import '../model/tasks_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTask = '';
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightBlueAccent, fontSize: 24),
                    ),
                    TextField(
                      onChanged: (value) {
                        newTask = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (newTask.isNotEmpty) {
                          Provider.of<TasksData>(context, listen: false)
                              .add(newTask);
                          // Provider.of<TasksData>(context, listen: false)
                          //     .tasks
                          //     .add(Task(title: newTask));

                          Navigator.pop(context);
                        }
                      },
                      child: Text('ADD'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 24, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 32,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 32,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'To Do',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TasksData>(context).tasksCount} task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
