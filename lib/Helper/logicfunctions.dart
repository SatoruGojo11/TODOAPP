import 'package:flutter/material.dart';
import 'package:todoapp/Data/database.dart';

class Logicfuncs extends ChangeNotifier {
  // refer a database
  TodoDatabase db = TodoDatabase();

  // create new task while clicking on Floating action button
  createnewtask(ctx, taskctrl) {
    print('Logic Funcs');
    return showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow[500],
        content: Container(
          height: 150,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // for taking user input
              TextField(
                strutStyle: StrutStyle(height: 1.3),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                controller: taskctrl,
                decoration: InputDecoration(
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
                        Navigator.pop(context);
                      }
                      Future.delayed(Duration(seconds: 2), () => notifyListeners());
                      db.updateData();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // cancel button
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
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
    Future.delayed(Duration(seconds: 2), () => notifyListeners());
  }
}
