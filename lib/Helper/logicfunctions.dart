import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoapp/Data/database.dart';

class Logicfuncs extends ChangeNotifier {
  // refer a database
  TodoDatabase db = TodoDatabase();

  // create new task while clicking on Floating action button
  createnewtask(ctx, taskctrl) {
    log('Logic Funcs');
    return showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.yellow[500],
        content: SizedBox(
          height: 150,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // for taking user input
              TextField(
                strutStyle: const StrutStyle(height: 1.3),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                controller: taskctrl,
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 50,
                    ),
                  ),
                  hintText: "Add a new task",
                ),
              ),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  TextButton(
                    onPressed: () {
                      if (taskctrl.text.isNotEmpty) {
                        db.todoList.add([taskctrl.text, false]);
                        taskctrl.clear();
                        Navigator.pop(ctx);
                      }
                      Future.delayed(const Duration(seconds: 2), () => notifyListeners());
                      db.updateData();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // cancel button
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //what's gonna happen when Check box Tapped
  checkboxtap(bool? value, int index) {
    db.todoList[index][1] = !db.todoList[index][1];
    db.updateData();
    Future.delayed(const Duration(seconds: 2), () => notifyListeners());
  }
}
