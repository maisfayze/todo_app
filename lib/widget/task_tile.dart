import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/taskdata_provider.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    String newtask = '';
    return Dismissible(
      key: UniqueKey(),
      // direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        color: Colors.green,
        child: const Text(
          'Update',
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Text(
          'Delete',
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // setState((){
          // widget.tasks.removeAt(index);
          Provider.of<TaskData>(context, listen: false).removeTask(task);
          // });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                '${task.title} deleted',
              )));
        }
        if (direction == DismissDirection.startToEnd) {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Update Task',
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: task.title),
                        onChanged: (value) {
                          newtask = value;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // setState((){
                            // tasks.add(Task(title: task));
                            Provider.of<TaskData>(context, listen: false)
                                .updateTask(task, newtask);
                            // });
                            Navigator.pop(context);
                          },
                          child: const Text('Update'))
                    ],
                  ),
                );
              });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                '${task.title} updated',
              )));
        }
      },
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: MyCheckBox(
          isChecked: task.isDone,
          fun: (v) {
            Provider.of<TaskData>(context, listen: false).toggle(task);
          },
        ),
      ),
    );
  }
}

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({Key? key, required this.isChecked, this.fun})
      : super(key: key);
  final bool isChecked;
  final Function(bool?)? fun;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: fun,
    );
  }
}
