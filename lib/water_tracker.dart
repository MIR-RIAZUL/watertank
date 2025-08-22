import 'package:flutter/material.dart';

class water_tracker extends StatefulWidget {
  const water_tracker({super.key});

  @override
  State<water_tracker> createState() => _water_trackerState();
}

class _water_trackerState extends State<water_tracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Water Tracker"),
        backgroundColor: Colors.white24,
      ),
      body: Center(
        child: (Column(
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(30),
              // width: 110,
              // height: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Water Intake",

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2000 ltr',

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    // valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 10,
                    value: 0.7,
                    // valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                Text(
                  "70%",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
