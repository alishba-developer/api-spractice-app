import 'package:api_app/Controller/API/todocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purpleAccent,
        elevation: 20,
        centerTitle: true,
        title: const Text(
          'Add Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.defaultDialog(
                title: 'Enter New Task 📝',
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(labelText: 'Enter task'),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(width: 30),
                          ElevatedButton(
                            onPressed: () {
                              todoController.postTodos(
                                textEditingController.text,
                              );
                              textEditingController.clear();
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              'SAVE',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.white, size: 30),
                  SizedBox(width: 5),
                  Text(
                    'ADD NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'All Todo List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.TodoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.TodoList[index];
                    return Obx(
                      () =>
                          todoController.isloading.value
                              ? Lottie.network(
                                "https://lottie.host/0418f2ba-b6d0-4937-beb8-113968e88af8/0STGlUmlmw.json",
                                backgroundLoading: true,
                                alignment: Alignment.bottomCenter,
                                height: 100,
                                width: 100,
                              )
                              : Column(
                                children:
                                    todoController.TodoList.map(
                                      (e) => Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.purpleAccent,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.add_circle,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  e.title.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                      title: 'Edit Task 📝',
                                                      content: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            TextFormField(
                                                              controller:
                                                                  textEditingController,
                                                              decoration:
                                                                  InputDecoration(
                                                                    labelText:
                                                                        'Enter task',
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                OutlinedButton(
                                                                  onPressed: () {
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                      color:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 30,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed: () {
                                                                    textEditingController
                                                                        .clear();
                                                                    todoController
                                                                        .putTodos(
                                                                          todo.id!,
                                                                          "Updated Title",
                                                                        );
                                                                    Get.back();
                                                                    print(
                                                                      textEditingController
                                                                          .text,
                                                                    );
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .purpleAccent,
                                                                    foregroundColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  child: Text(
                                                                    'EDIT',
                                                                    style: TextStyle(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                      title: 'Delete Task📝',
                                                      content: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                OutlinedButton(
                                                                  onPressed: () {
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                    'No',
                                                                    style: TextStyle(
                                                                      color:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 30,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed: () {
                                                                    todoController
                                                                        .deleteTodos(
                                                                          e.id,
                                                                        );
                                                                    Get.back();
                                                                    print(
                                                                      textEditingController
                                                                          .text,
                                                                    );
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .purpleAccent,
                                                                    foregroundColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  child: Text(
                                                                    'YES',
                                                                    style: TextStyle(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).toList(),
                              ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
