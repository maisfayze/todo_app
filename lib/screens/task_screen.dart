import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/taskdata_provider.dart';
import '../widget/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String newTask = '';

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 72, bottom: 24, left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.deepPurple,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'TO DO',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).count} tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(10),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            context: context,
            builder: (context) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Add Task',
                      style: TextStyle(color: Colors.deepPurple, fontSize: 24),
                    ),
                    TextField(
                      onChanged: (value) {
                        newTask = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Add Task',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(newTask);

                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),
          );
          // showMaterialModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(
          //     child: Column(
          //       children: [
          //         Text(
          //           'Add Task',
          //           style: TextStyle(color: Colors.deepPurple, fontSize: 24),
          //         ),
          //         TextField(
          //           decoration: InputDecoration(
          //             hintText: 'Add Task',
          //           ),
          //         ),
          //         ElevatedButton(onPressed: () {}, child: Text('Add')),
          //       ],
          //     ),
          //   ),
          // );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
