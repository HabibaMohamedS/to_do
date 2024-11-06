import 'package:flutter/material.dart';
import 'package:to_do/models/taskModel.dart';
//import 'package:confetti/confetti.dart';

class taskCard extends StatefulWidget {
  final TaskModel taskModel;
  const taskCard({super.key, required this.taskModel});

  @override
  State<taskCard> createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
  bool isTaskCompleted = false;

  void toggleTaskCompletion() {
    setState(() {
      isTaskCompleted = !isTaskCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.delete,
          size: 24,
          color: Colors.white,
        ),
      ),
      child: Card(
        color: Theme.of(context).colorScheme.onBackground,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListTile(
          leading: Container(
            width: 5,
            height: 75,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isTaskCompleted
                    ? [Color.fromARGB(255, 51, 224, 57), Colors.green]
                    : [
                        Color.fromARGB(255, 58, 113, 243),
                        Color.fromARGB(255, 140, 58, 211),
                      ],
              ),
            ),
          ),
          title: Text(widget.taskModel.name),
          subtitle: Text(widget.taskModel.details),
          trailing: isTaskCompleted
              ? Text(
                  'Done!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 43, 194, 48),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )
              : IconButton(
                  icon: Icon(Icons.check_circle_outline_outlined),
                  color: Color.fromARGB(255, 103, 116, 117),
                  iconSize: 40,
                  onPressed: toggleTaskCompletion,
                ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
