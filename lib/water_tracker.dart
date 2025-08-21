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
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Water Tracker"),
        backgroundColor: Colors.teal,
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
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
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
            SizedBox(height: 30),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 10,
              value: 0.5,
              // valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ],
        )),
      ),
    );
  }
}
