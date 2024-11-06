import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/taskModel.dart';
import 'package:to_do/provider/tasksProvider.dart';
//import 'package:to_do/services/firebaseServices.dart';
import 'package:to_do/taskCard.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _ListState();
}

List<TaskModel> taskModellist = [];
// List.generate(
//     10,
//     (index) => TaskModel(
//         name: 'name$index',
//         details: 'details$index',
//         dateTime: DateTime.now(),
//         isdone: false));

class _ListState extends State<list> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context, listen: false);

    // if (taskModellist.isEmpty) {
    //   provider.getAllTasks();
    // }
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          //initialDate: DateTime.now(),

          onDateChange: (selectedDate) {
            provider.changeSelectedDate(selectedDate);
            //`selectedDate` the new date selected.
          },
          // headerProps: const EasyHeaderProps(
          //   monthPickerType: MonthPickerType.switcher,
          //   dateFormatter: DateFormatter.fullDateDMY(),
          // ),
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
            // inactiveDayStyle: DayStyle(
            //   dayNumStyle: TextStyle(color: null).merge(Theme.of(context).textTheme.displaySmall),
            // )
          ),
          firstDate: DateTime(2024, 11, 4),
          focusDate: DateTime.now(),
          // Provider.of<TasksProvider>(context, listen: false).dateTime,
          lastDate: DateTime(2025),
        ),
        // ListView.builder(
        //   padding: EdgeInsets.only(top: 10),
        //   itemCount: provider.tasks.length,
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   itemBuilder: (context, index) {
        //     print("hwlooo");
        //     print(provider.tasks[index]);
        //     return taskCard(
        //       taskModel: provider.tasks[index],
        //     );
        //   },
        // ),
        FutureBuilder<List<TaskModel>?>(
          future:
              Provider.of<TasksProvider>(context, listen: false).getAllTasks(),
          builder: (context, snapshot) {
            print('XXX->${snapshot.connectionState}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              var data = snapshot.data;
              print('XXX->${snapshot.data}');
              if (data == null || data.isEmpty) {
                return const Expanded(
                    child: Center(
                  child: Text('No tasks today'),
                ));
              }
              return ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (context, index) => taskCard(
                  taskModel: (data)[index],
                ),
                itemCount: (data).length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              );
            }
          },
        )
      ],
    );
  }
  // getAllTasks()async{
  //  try{List<TaskModel> tasks=await FirebaseServices.getTasks();
  //  taskModellist=tasks;
  //  setState(() {

  //  });}catch(e){
  //   print(e);
  //  }
  // }
}
