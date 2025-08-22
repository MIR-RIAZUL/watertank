import 'package:flutter/material.dart';

class Add_water_button extends StatelessWidget {
  const Add_water_button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.water_drop),
          label: Text("100 litre"),
        ),
      ),
    );
  }
}
