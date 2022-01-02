import 'package:flutter/material.dart';
import 'package:task/style/theme.dart';

class Mybutton extends StatelessWidget {
  final String label;
  final Function()? onTTap;
  const Mybutton({Key? key, required this.label, required this.onTTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTTap,
      child: Container(
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
