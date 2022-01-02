import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/db/db_helper.dart';
import 'package:task/screens/homepage.dart';
import 'package:task/services/themeServices.dart';
import 'package:task/style/theme.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      theme: ThemeService().theme,
      // darkTheme: MyTheme.dark(),
      debugShowCheckedModeBanner: false,

      //
      home: const HomePage(),
    );
  }
}
