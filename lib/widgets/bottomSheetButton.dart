// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomSheetButton extends StatelessWidget {
  String label;
  VoidCallback onTTap;
  bool isClose;
  Color clr;
  bottomSheetButton({
    Key? key,
    required this.label,
    required this.onTTap,
    required this.isClose,
    required this.clr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey.shade600
                    : Colors.red
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.3,
          ),
        )),
      ),
    );
  }
}
