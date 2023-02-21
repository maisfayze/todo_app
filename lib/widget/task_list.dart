import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/taskdata_provider.dart';
import 'package:todo/widget/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newtask = '';
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: Provider.of<TaskData>(context).tasks[index]);

        // return Dismissible(
        //   key: Key('item ${Provider.of<TaskData>(context).tasks[index]}'),
        //   child: TaskTile(
        //     task: Provider.of<TaskData>(context).tasks[index],
        //   ),
        // );
      },
    );
  }
}
