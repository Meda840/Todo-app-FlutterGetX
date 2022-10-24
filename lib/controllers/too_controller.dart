import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/to_do_model.dart';

class TodoController extends GetxController{
   var todos = <Todo>[].obs;

   @override
   void onInit(){
      List storedTodos = GetStorage().read<List>('todos');

      if(storedTodos?.isNotEmpty ?? false ) {
         todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
      }

      ever(todos, (_){
         GetStorage().write('todos', todos.toList());
      });
      super.onInit();
   }
}