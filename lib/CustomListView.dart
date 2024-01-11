import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasknew/model/Task.dart';
import 'package:tasknew/taskproider.dart';

class CustomListView extends StatefulWidget {
  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Taskproider>(
      builder: (BuildContext context, Taskproider value, Widget? child) {
        return ListView.builder(
          itemCount: value.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(value.tasks[index].name),
              leading: TextButton(
                onPressed: () => value.deleteTask(value.tasks[index]),
                child: Text(
                  "delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              trailing: Checkbox(
                value: value.tasks[index].isDone,
                onChanged: (newvalu) {
                  value.updatecheck(value.tasks[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
