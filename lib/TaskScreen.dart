import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasknew/AddTask.dart';
import 'package:tasknew/CustomListView.dart';
import 'package:tasknew/taskproider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTask()));
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo[400],
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.playlist_add_check,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "ToDayDo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                '${Provider.of<Taskproider>(context).tasks.length} Tasks',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomListView(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
