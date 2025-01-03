import 'dart:io';

import 'package:flutter/material.dart';
import 'package:try_flutter/db/todo_api.dart';
import 'package:try_flutter/db/todo_db.dart';
import 'package:try_flutter/create_todo_widget.dart';

class TodoApiCrud extends StatefulWidget {
  const TodoApiCrud({super.key});

  @override
  State<TodoApiCrud> createState() => _TodoApiCrudState();
}

class _TodoApiCrudState extends State<TodoApiCrud> {
  Future<dynamic>? futureTodo;
  final todoDb = TodoDb();
  final todoApi = TodoApi();
  @override
  void initState() {
    super.initState();
    getTodo();
  }

  void getTodo() {
    setState(() {
      futureTodo = todoApi.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: FutureBuilder(
          future: futureTodo,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data == null) {
                return const Center(
                  child: Text("no Todo added yet"),
                );
              }
              final todos = snapshot.data!;
              return todos.isEmpty
                  ? const Center(child: Text("No todo added yet"))
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 12);
                      },
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => CreateTodoWidget(
                                    todoApi: todo,
                                    onSubmit: (title) async {
                                      await todoApi.put(
                                          id: todo.id, title: title);
                                      if (!mounted) return;
                                      getTodo();
                                      Navigator.of(context).pop();
                                    }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Icon(Icons.add)),
                              Expanded(child: Text(todo.title)),
                              IconButton(
                                  onPressed: () async {
                                    await todoApi.delete(id: todo.id);
                                    getTodo();
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red))
                            ],
                          ),
                        );
                      },
                      itemCount: todos.length);
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => CreateTodoWidget(onSubmit: (title) async {
                    await todoApi.post(title: title);
                    if (!mounted) return;
                    getTodo();
                    Navigator.of(context).pop();
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
