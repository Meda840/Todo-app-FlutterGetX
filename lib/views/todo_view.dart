import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/too_controller.dart';

import '../models/to_do_model.dart';

class TodoView extends StatelessWidget{

final TodoController todoController = Get.find();
final int index ;

TodoView({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text ='' ;
    if (this.index != null) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController( text: text);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your Todo")
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "what do you want to do?",
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 22, color: Colors.purple[200]),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  child: const Text("Cancel"),
                    onPressed: () { Get.back();},
                ),
                ElevatedButton(
                    onPressed: (){
                      if (this.index==null) {
                        todoController.todos.add(Todo(text: textEditingController.text));
                      }else{
                        var editing = todoController.todos[index];
                        editing.text = textEditingController.text;
                        todoController.todos[index] = editing;
                      }

                      Get.back();
                      },
                    child:  Text((this.index==null) ? "Add" : "Edit")
                )
              ],
            ),
          ]

        ),
      ),
    );
  }
}