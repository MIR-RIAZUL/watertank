import 'dart:async';

import 'package:flutter/material.dart';

import 'add_water_button.dart';

class water_tracker extends StatefulWidget {
  const water_tracker({super.key});

  @override
  State<water_tracker> createState() => _water_trackerState();
}

class _water_trackerState extends State<water_tracker> {
  int current_intake = 0;
  final int goal_intake = 2000;
  final int max_intake = 10000;
  Timer? timer;
  // Add this import at the top of the file
  Timer? _leakTimer;

  void add_water(int amount) {
    setState(() {
      current_intake = (current_intake + amount).clamp(0, max_intake);
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (current_intake / max_intake).clamp(0, 1);
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
                    '${current_intake} LTR',

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
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
                    value: progress,
                    // valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 30,
              children: [
                Add_water_button(amount: 100, onclick: () => add_water(100)),
                Add_water_button(amount: 200, onclick: () => add_water(200)),
                Add_water_button(amount: 500, onclick: () => add_water(500)),
                Add_water_button(amount: 1000, onclick: () => add_water(1000)),
                Add_water_button(amount: 2000, onclick: () => add_water(2000)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    current_intake = 0;
                  });
                },
                child: Text("Reset tank"),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: ElevatedButton(
                // Optional: cancel leak when filling, then fill the tank
                onPressed: () {
                  _leakTimer?.cancel();
                  setState(() {
                    current_intake = max_intake;
                  });
                },
                child: Text("Fill tank"),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: ElevatedButton(
                // Replace your "leak" button onPressed with this
                onPressed: () {
                  // Do NOT call initState() here
                  if (_leakTimer?.isActive ?? false)
                    return; // prevent multiple timers

                  _leakTimer = Timer.periodic(const Duration(seconds: 1), (_) {
                    if (!mounted) return;

                    if (current_intake > 0) {
                      setState(() {
                        // adjust the step as needed (e.g., 1, 10, 100 mL per second)
                        current_intake = (current_intake - 1).clamp(
                          0,
                          max_intake,
                        );
                      });
                    } else {
                      _leakTimer?.cancel();
                    }
                  });
                },
                child: Text(" Lick water in every second"),
              ),
            ),
          ],
        )),
      ),
    );
  }

  // Also add this to your State to clean up the timer
  @override
  void dispose() {
    _leakTimer?.cancel();
    super.dispose();
  }
}
