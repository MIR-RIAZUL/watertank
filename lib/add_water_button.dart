import 'package:flutter/material.dart';

class Add_water_button extends StatelessWidget {
  final int amount;
  IconData? icon;
  final VoidCallback onclick;
  Add_water_button({
    super.key,
    required this.amount,
    required this.onclick,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton.icon(
          onPressed: () {
            onclick();
          },
          icon: Icon(icon ?? Icons.water_drop),
          label: Text("+${amount}"),
        ),
      ),
    );
  }
}
