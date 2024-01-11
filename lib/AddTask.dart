import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasknew/model/Task.dart';
import 'package:tasknew/taskproider.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var txt = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Can not be Empty";
                  }
                  return null;
                },
                autofocus: true,
                controller: txt,
              ),
              SizedBox(
                height: 120,
              ),
              TextButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    Provider.of<Taskproider>(context, listen: false)
                        .addtask(txt.text!);
                    Navigator.pop(context);
                  }
                },
                child: Text("Add"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                  primary: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
