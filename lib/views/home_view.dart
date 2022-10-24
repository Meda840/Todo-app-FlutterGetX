import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/too_controller.dart';
import 'package:getx_todo_app/views/todo_view.dart';

class HomeView extends StatelessWidget {



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
          },),
    body: Center(
      child: Obx(()=>
          ListView.separated(
              itemBuilder: (context, index)=> Dismissible(key: UniqueKey(),
               onDismissed: (_){
                var removed = todoController.todos[index];
                todoController.todos.removeAt(index);
                Get.snackbar('task removed "${removed.text}"', "med has removed the task");
               },
                child: ListTile(
                title: Text(todoController.todos[index].text,
                style: (todoController.todos[index].done ?
                const TextStyle(color: Colors.greenAccent, decoration: TextDecoration.lineThrough) :
                const TextStyle(color: Colors.redAccent)),),
                onTap: (){
                  Get.to(TodoView(index: index));
                },
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (v) {
                     var changed = todoController.todos[index];
                     changed.done = v;
                     todoController.todos[index] = changed;
                  },
                ),
                trailing: const Icon(Icons.edit,),
              ),
              ),
              separatorBuilder: (_,__)=>const Divider(),
              itemCount: todoController.todos.length)
      ),
    )
  );
  }
}