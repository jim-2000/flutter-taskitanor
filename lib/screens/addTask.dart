import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/controllers/task_controller.dart';
import 'package:task/models/task.dart';
import 'package:task/services/themeServices.dart';
import 'package:task/style/theme.dart';
import 'package:task/widgets/Buttons.dart';
import 'package:task/widgets/inputfield.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  // String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  //

  List<String> repeadsList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  String _selectedRepead = "None";
  //
  int _slectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task", style: context.theme.textTheme.headline4),
              MyInputField(
                title: "Title",
                hint: "Enter Title Hare",
                controller: _titleController,
              ),
              MyInputField(
                title: "Note",
                hint: "Enter Notes Hare",
                controller: _noteController,
              ),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () {
                    print("HIIIIIIIIIIIIIII");
                    _getDateFromUser(context);
                  },
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          print("start-------");
                          _getTimeFromUser(true);
                        },
                        icon: Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MyInputField(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          print("End-------");
                          _getTimeFromUser(false);
                        },
                        icon: Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //
              MyInputField(
                title: "Reminder",
                hint: "$_selectedRemind minutes Early",
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey,
                  ),
                  underline: SizedBox(),
                  iconSize: 32,
                  elevation: 4,
                  onChanged: (String? newV) {
                    setState(() {
                      _selectedRemind = int.parse(newV!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int v) {
                    return DropdownMenuItem<String>(
                      value: v.toString(),
                      child: Text(
                        v.toString(),
                        style: TextStyle(color: Colors.black87),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // Repet list

              MyInputField(
                title: "Repeat",
                hint: _selectedRepead,
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newV) {
                    setState(() {
                      _selectedRepead = newV!;
                    });
                  },
                  items:
                      repeadsList.map<DropdownMenuItem<String>>((String value) {
                    //
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black87),
                      ),
                    );
                  }).toList(),
                ),
              ),
//
              SizedBox(
                height: 18,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPalate(),
                  Mybutton(label: "Create Task", onTTap: () => _validateDate()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //
  }

  //validation form

  _validateDate() {
    //
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      // add to database
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      //
      Get.snackbar(
        "Required",
        "All Fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: pinkClr.withOpacity(0.6),
        icon: Icon(Icons.warning),
        duration: Duration(seconds: 4),
      );
    }
  }

  //
  _addTaskToDb() async {
    //
    int value = await _taskController.addTask(
      task: Task(
        title: _titleController.text,
        note: _noteController.text,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        isCompleted: 0,
        color: _slectedColor,
        remind: _selectedRemind,
        repeat: _selectedRepead,
      ),
    );
    print("My ID is =>>>> $value");
  }
// color Plate

  _colorPalate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: context.theme.textTheme.headline2,
        ),
        //
        SizedBox(
          height: 8.0,
        ),
        //colors
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _slectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : yellowClr,
                  child: _slectedColor == index
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

// date picker

  _getDateFromUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("it's null or SomeThisng is wrong");
    }
  }

// time picker
  _getTimeFromUser(bool isStartingTime) async {
    // {required bool isStartingTime, required BuildContext context}
    final pickedTime = await _showTimepicker();

    String _formetedTime = pickedTime.format(context);
//
    if (pickedTime == null) {
      // setState(() {
      //   _startTime = "12:10";
      //   _endTime = "9:50";
      // });
    }
    if (isStartingTime == true) {
      setState(() {
        _startTime = _formetedTime;
        print(_startTime);
      });
    } else if (isStartingTime == false) {
      setState(() {
        _endTime = _formetedTime;
      });
    }
  }

//
  _showTimepicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: new TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }

//
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back,
        ),
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
}
