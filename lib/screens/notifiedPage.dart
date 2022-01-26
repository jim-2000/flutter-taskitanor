import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifiedScreen extends StatelessWidget {
  final String? label;
  const NotifiedScreen({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_outlined)),
        title: Text(this.label!.toString().split("|")[0]),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Get.isDarkMode ? Colors.black : Colors.grey.shade600,
          ),
          child: Center(
            child: Text(
              this.label!.toString().split("|")[1],
              style: TextStyle(
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w300,
                letterSpacing: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
