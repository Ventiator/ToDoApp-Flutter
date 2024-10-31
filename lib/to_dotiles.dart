import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDotiles extends StatelessWidget {
  const ToDotiles(
      {super.key,
      required this.taskcompleted,
      required this.onChange,
      required this.taskname,
      required this.deletetask,
      required this.isFirstTile});

  final void Function(bool?)? onChange;
  final bool? taskcompleted;
  final String taskname;
  final bool isFirstTile;
  final Function(BuildContext)? deletetask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFirstTile
          ? EdgeInsets.all(20)
          : EdgeInsets.only(left: 20, bottom: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            icon: Icons.delete,
            onPressed: deletetask,
            backgroundColor: Colors.red.shade200,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber[400],
          ),
          child: Row(
            children: [
              Checkbox(value: taskcompleted, onChanged: onChange),
              Expanded(
                child: Text(taskname,
                    style: GoogleFonts.robotoSlab(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: taskcompleted == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
