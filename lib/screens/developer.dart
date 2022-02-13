import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  const Developer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img =
        "https://avatars.githubusercontent.com/u/64397792?s=400&u=b893043c1c3b0a6ef368d9c9e4ee71dda86159c6&v=4";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("About Me"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.moon_stars)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              )),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(img),
                    radius: 60.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            //
            Text(
              "Al-Hossain JIM",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Narayangonj, Dhaka",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueGrey.shade700,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Front-end Developer at Alfa-Soft Company",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Jan-19 To Jul-2020",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueGrey.shade700,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Munshiganj Polytechnical Institutions",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Computer Technology",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "3rd Semester",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
            ),
            Text(
              "-Experience-",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "React",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "React Native",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Flutter",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Next js",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "JavaScript",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Python",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Dart",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "-CONTACT-",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text("hossainaljim24@gmail.com"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text("+880 1843687579"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.facebook),
                title: Text("https://www.facebook.com/Exceptional.jim404"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: Icon(CupertinoIcons.cube_box),
                title: Text("https://github.com/jim-2000"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
