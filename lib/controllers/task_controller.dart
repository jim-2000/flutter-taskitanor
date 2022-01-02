// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:task/db/db_helper.dart';
import 'package:task/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    // TODO: implement onReady
    super.onReady();
  }
//

  //
  final taskLists = <Task>[].obs;
  // geting task
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskLists.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

//
  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task!);
  }

  //
  void deleteTask(Task task) {
    DBHelper.delete(task);
    getTasks();
  }

  //
  void markTaskComplete(int id) async {
    await DBHelper.update(id);
    getTasks();
  }

  //
  void unMarkTaskComplete(int id) async {
    await DBHelper.updateAgain(id);
    getTasks();
  }
}

  // Task(
  //     title: _titleController.text,
  //     note: _noteController.text,
  //     date: DateFormat.yMd().format(_selectedtime),
  //     startTime: _startTime,
  //     endTime: _endTime,
  //     isCompleted: false,
  //     color: _slectedColor,
  //     remind: _selectedRemind,
  //     repeat: _selectedRepead,
  //   );