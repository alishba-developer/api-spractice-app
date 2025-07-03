import 'dart:convert';

import 'package:api_app/TodoModel/todomodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  RxBool isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  // var TodoList = RxList<TodoModel>();
  var TodoList = <TodoModel>[].obs;

  get index => null; // Rx For update list

  //Get Todo

  Future<void> getTodos() async {
    isloading.value = true;

    final response = await http.get(
      Uri.parse("https://684c2168ed2578be881dc80e.mockapi.io/GetApi/TodoList"),
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        TodoList.add(TodoModel.fromJson(index));
      }
      isloading.value = false;
    } else {
      print("Failed to fetch");
    }
  }

  //Post Todo
  // Future <void> postTodos(title) async {
  //   final response = await http.post(Uri.parse(
  //       "https://684c2168ed2578be881dc80e.mockapi.io/GetApi/TodoList"),
  //    headers: {'content-Type' :'application/json'},
  //     body: json.encode({'title':title}),
  //   );
  //   if(response.statusCode==200){
  //     print('Done');
  //     TodoList.clear();
  //     getTodos();
  //   } else{
  //     print('Failed');
  //   }
  // }
  //post Todo

  Future<void> postTodos(String title) async {
    isloading.value = true;
    final response = await http.post(
      Uri.parse("https://684c2168ed2578be881dc80e.mockapi.io/GetApi/TodoList"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'title': title}),
    );

    if (response.statusCode == 201) {
      print('Post Done');
      TodoList.clear();
      await getTodos(); // Just call getTodos() — list will auto-update
      isloading.value = false;
    } else {
      print('Post Failed');
    }
  }

  //put Todo
  // PUT Todo (Update)
  Future<void> putTodos(String id, String updatedTitle) async {
    isloading.value = true;

    final response = await http.put(
      Uri.parse(
        "https://684c2168ed2578be881dc80e.mockapi.io/GetApi/TodoList/$id",
      ),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'title': updatedTitle}),
    );

    if (response.statusCode == 200) {
      print('Update Done');
      TodoList.clear(); // Refresh list after update
      await getTodos();
      isloading.value = false;
    } else {
      print('Update Failed');
    }
  }

  //delete Todo
  Future<void> deleteTodos(id) async {
    isloading.value = true;
    final response = await http.delete(
      Uri.parse(
        "https://684c2168ed2578be881dc80e.mockapi.io/GetApi/TodoList/$id",
      ),
    );
    if (response.statusCode == 200) {
      print('Done');
      TodoList.clear();
      await getTodos();
      isloading.value = false;
    } else {
      print('Failed');
    }
  }
}
