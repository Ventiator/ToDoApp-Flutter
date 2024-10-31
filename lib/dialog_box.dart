import 'package:flutter/material.dart';
import 'package:todoapp/alert_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onsave;
  final void Function()? oncancel;

  const DialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add new task",
                border: OutlineInputBorder(),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertButton(
                    onpress: onsave,
                    name: "Save",
                    buttonicon: Icon(Icons.save),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AlertButton(
                    onpress: oncancel,
                    name: "Cancel",
                    buttonicon: Icon(Icons.cancel),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
