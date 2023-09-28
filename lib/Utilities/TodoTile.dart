import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/Data/database.dart';

class TODoTile extends StatelessWidget {
  final String Taskname;
  final bool TaskCompleted;
  final int tileindex;
  final Function(bool?)? Onchangedatcreatetask;
  final dynamic Onchangedatcheckboxtap;

  TODoTile({
    super.key,
    required this.Taskname,
    required this.TaskCompleted,
    required this.tileindex,
    required this.Onchangedatcreatetask,
    required this.Onchangedatcheckboxtap,
  });

  final db = TodoDatabase();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                print('Todo Tile');
                db.deleteData(tileindex);
                db.updateData();
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green[500],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Check Box
              Checkbox(
                value: db.todoList[tileindex][1],
                onChanged: Onchangedatcheckboxtap,
                activeColor: Colors.black87,
              ),
              // Task Name
              Text(
                db.todoList[tileindex][0],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  decoration: db.todoList[tileindex][1] == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}