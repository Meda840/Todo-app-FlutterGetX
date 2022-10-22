import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/too_controller.dart';
import 'package:getx_todo_app/views/todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context){
    final TodoController todoController = Get.put(TodoController());
  return Scaffold(
    appBar: AppBar(
      title: const Text("Med GetX Todo List", style: TextStyle(letterSpacing: 2.0),),
    ),
    floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
          Get.to(() => TodoView());
          },
    ),
    body: Container(
      child: Obx(
          ()=>ListView.separated(
              itemBuilder: (context, index)=>ListTile(
                title: Text(todoController.todos[index].text,
                style: (todoController.todos[index].done ?
                const TextStyle(color: Colors.greenAccent, decoration: TextDecoration.lineThrough) :
                const TextStyle(color: Colors.redAccent)),),
                onTap: (){},
                trailing: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (v) {
                     var changed = todoController.todos[index];
                     changed.done = v!;
                     todoController.todos[index] = changed;
                  },
                ),
              ),
              separatorBuilder: (_,__)=>const Divider(),
              itemCount: todoController.todos.length)
      ),
    )
  );
  }
}