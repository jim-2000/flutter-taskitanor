import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task/controllers/task_controller.dart';
import 'package:task/db/db_helper.dart';
import 'package:task/models/task.dart';
import 'package:task/screens/addTask.dart';
import 'package:task/services/notificationServices.dart';
import 'package:task/services/themeServices.dart';
import 'package:task/style/theme.dart';
import 'package:task/widgets/Buttons.dart';
import 'package:task/widgets/TaskTile.dart';
import 'package:task/widgets/bottomSheetButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
//
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // notifyHelper = NotifyHelper();
    NotifyHelper().initializeNotification();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(context),
          _dateTimePicker(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  //
  _dateTimePicker() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: pinkClr,
        deactivatedColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        dayTextStyle: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        monthTextStyle: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: _taskController.taskLists.length,
          itemBuilder: (context, index) {
            //
            Task task = _taskController.taskLists[index];

            if (task.repeat == 'Daily') {
              DateTime date = DateFormat.jm().parse(task.startTime.toString());
              final myTime = DateFormat("HH:mm").format(date);
              NotifyHelper().scheduledNotification(
                hr: int.parse(myTime.toString().split(":")[0]),
                mnt: int.parse(myTime.toString().split(":")[1]),
                task: task,
              );

              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                      child: Row(
                    children: [
                      //
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, task);
                        },
                        child: TaskTile(task),
                      ),
                    ],
                  )),
                ),
              );
            }
            if (task.date == DateFormat.yMd().format(_selectedDate)) {
              // when today and task day matched then show that days task and get a notifications
              // DateTime date = DateFormat.jm().parse(task.startTime.toString());
              // final myTime = DateFormat("HH:mm").format(date);
              // NotifyHelper().scheduledNotification(
              //   hr: int.parse(myTime.toString().split(":")[0]),
              //   mnt: int.parse(myTime.toString().split(":")[1]),
              //   task: task,
              // );
              //
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                      child: Row(
                    children: [
                      //
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, task);
                        },
                        child: TaskTile(task),
                      ),
                    ],
                  )),
                ),
              );
            } else {
              return Container();
              // return AnimationConfiguration.staggeredList(
              //   position: index,
              //   child: SlideAnimation(
              //     child: FadeInAnimation(
              //         child: Row(
              //       children: [
              //         //
              //         GestureDetector(
              //           onTap: () {
              //             _showBottomSheet(context, task);
              //           },
              //           child: TaskTile(task),
              //         ),
              //       ],
              //     )),
              //   ),
              // );
            }
          },
        );
      }),
    );
  }

  //
  _addTaskBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: context.theme.textTheme.headline6,
              ),
              Text(
                "Today",
                style: context.theme.textTheme.headline4,
              )
            ],
          ),
          Mybutton(
              label: "+ Add Task",
              onTTap: () async {
                await Get.to(AddTaskPage());
                _taskController.getTasks();
              }),
        ],
      ),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    return Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height / 3,
        // height: task.isCompleted == 1
        //     ? MediaQuery.of(context).size.height * 0.24
        //     : MediaQuery.of(context).size.height * 0.32,
        // color: _getBGClr(task.color ?? 0),
        color: Get.isDarkMode ? Colors.white : Colors.grey,
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Get.isDarkMode
                    ? Colors.grey.shade600
                    : Colors.grey.shade300,
              ),
              child: Center(
                  child: Text(
                task.title.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : bottomSheetButton(
                    label: "Task Completed",
                    onTTap: () {
                      _taskController.markTaskComplete(task.id!);
                      Get.back();
                    },
                    isClose: false,
                    clr: primaryClr,
                  ),
            bottomSheetButton(
              label: "Delete Task",
              onTTap: () {
                _taskController.deleteTask(task);
                Get.back();
              },
              isClose: false,
              clr: Colors.redAccent,
            ),
            SizedBox(
              height: 10,
            ),
            bottomSheetButton(
              label: "Close",
              onTTap: () {
                Get.back();
              },
              isClose: true,
              clr: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return bluishClr;
    }
  }
}

//

//

_appBar() {
  return AppBar(
    leading: GestureDetector(
      child: Get.isDarkMode
          ? Icon(
              Icons.wb_sunny_outlined,
              size: 20,
              color: Colors.white,
            )
          : Icon(
              Icons.nightlight_round,
              size: 20,
              color: Colors.black,
            ),
      onTap: () {
        ThemeService().swithTheme();
        NotifyHelper().displayNotification(
          id: 45456,
          title: " Theme Changed",
          body: Get.isDarkMode ? "Active light Theme" : "Activated Dark Theme",
        );

        // NotifyHelper().scheduledNotification(
        //   body: "This is Local notification",
        //   sec: 2,
        //   title: "Come in my bleed",
        // );
      },
    ),
    actions: [
      CircleAvatar(
        backgroundImage: AssetImage("assets/images/user.png"),
      ),
      SizedBox(
        width: 20,
      ),
    ],
  );
}
