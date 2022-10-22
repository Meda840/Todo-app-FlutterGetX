import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/controllers/too_controller.dart';

import '../models/to_do_model.dart';

class TodoView extends StatelessWidget{

final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your Todo")
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
                      todoController.todos.add(Todo(text: textEditingController.text,));
                      Get.back();
                      },
                    child: const Text("Add Todo")
                )
              ],
            ),
          ]

        ),
      ),
    );
  }
}