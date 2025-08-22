import 'package:flutter/material.dart';

class Add_water_button extends StatefulWidget {
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
  State<Add_water_button> createState() => _Add_water_buttonState();
}

class _Add_water_buttonState extends State<Add_water_button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton.icon(
          onPressed: () {
            widget.onclick();
          },
          icon: Icon(widget.icon ?? Icons.water_drop),
          label: Text("+${widget.amount}"),
        ),
      ),
    );
  }
}
