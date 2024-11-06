import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:to_do/list.dart';
import 'package:to_do/models/taskModel.dart';
import 'package:to_do/provider/tasksProvider.dart';
//import 'package:to_do/services/firebaseServices.dart';

class modalForm extends StatefulWidget {
  const modalForm({super.key});

  @override
  State<modalForm> createState() => _modalFormState();
}

TextEditingController taskName = TextEditingController();
TextEditingController Details = TextEditingController();
DateTime selectedDate = DateTime.now();

class _modalFormState extends State<modalForm> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "add new task",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: taskName,
            decoration: InputDecoration(hintText: "Task Name"),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            maxLines: 5,
            controller: Details,
            decoration: InputDecoration(hintText: "Details"),
          ),
          Text("select date:"),
          TextButton(
              onPressed: () {
                showDatePicker(
                    onDatePickerModeChange: (value) {
                      selectedDate = value as DateTime;
                    },
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)));
              },
              child: Text("Date")),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary),
              onPressed: () async {
                //change date
                // taskModellist.add(TaskModel(
                //     name: taskName.text,
                //     details: Details.text,
                //     dateTime: DateTime.now(),
                //     isdone: false));
                TaskModel newTask = TaskModel(
                    name: taskName.text.trim(),
                    details: Details.text.trim(),
                    dateTime: selectedDate,
                    isdone: false);
                await provider.addTask(newTask);
                //addTask();
                Navigator.of(context).pop();
                // setState(() {});
              },
              child: Text(
                "ADD",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // addTask() async {
  //   try {
  //     TaskModel newTask = TaskModel(
  //         name: taskName.text.trim(),
  //         details: Details.text.trim(),
  //         dateTime: selectedDate,
  //         isdone: false);
  //     await FirebaseServices.addTask(newTask);
  //     Navigator.of(context).pop();
  //   } catch (e) {
  //     print(e);
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("error ad")));
  //   }
  // }
}
