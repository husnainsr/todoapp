import 'package:flutter/material.dart';
import 'package:todoapp/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {Key? key,
      required this.controller,
      required this.onCancel,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //User Input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add A New Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 55,
                ),
                MyButtons(
                  text: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
