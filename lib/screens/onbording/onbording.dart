import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/screens/homepage.dart';

class OnbordingScreens extends StatelessWidget {
  const OnbordingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/onbord.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 410,
            left: 30,
            width: Get.size.width - 60,
            height: 65,
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Center(
                    child: Text(
                  "Make your day".toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ),
          Positioned(
            bottom: 380,
            left: 30,
            width: Get.size.width - 60,
            height: 65,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Center(
                child: Text(
                  "To Do is a task management app ",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            width: Get.size.width - 60,
            height: 65,
            child: InkWell(
              onTap: () {
                Future.delayed(Duration(seconds: 3));
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HomePage()));
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                    child: Text(
                  "START YOUR DAY",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
