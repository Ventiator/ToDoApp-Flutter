import 'package:flutter/material.dart';

class AlertButton extends StatelessWidget {
  final String name;
  final Icon buttonicon;
  final void Function()? onpress;

  const AlertButton(
      {required this.name,
      required this.buttonicon,
      required this.onpress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onpress,
        color: Colors.amber[100],
        child: Row(
          children: [
            buttonicon,
            SizedBox(
              width: 8,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
