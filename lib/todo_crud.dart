// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:try_flutter/model/todo_model.dart';
import 'package:try_flutter/create_todo_widget.dart';
import 'package:try_flutter/db/todo_db.dart';
import 'package:flutter/material.dart';

class TodoCrud extends StatefulWidget {
  const TodoCrud({super.key});

  @override
  State<TodoCrud> createState() => _TodoCrudState();
}

class _TodoCrudState extends State<TodoCrud> {
  Future<List<TodoModel>>? futureTodo;
  final todoDb = TodoDb();

  @override
  void initState() {
    super.initState();
    getTodo();
  }

  void getTodo() {
    setState(() {
      futureTodo = todoDb.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => CreateTodoWidget(onSubmit: (title) async {
                    await todoDb.create(title: title);
                    if (!mounted) return;
                    getTodo();
                    Navigator.of(context).pop();
                  }));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: futureTodo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data == null) {
              return const Center(
                child: Text("No Todo Added Yet"),
              );
            }
          }

          final todos = snapshot.data!;

          return todos.isEmpty
              ? const Center(
                  child: Text("No Todo Added Yet"),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      trailing: IconButton(
                        onPressed: () async {
                          await todoDb.delete(todo.id);
                          getTodo();
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CreateTodoWidget(
                            todo: todo,
                            onSubmit: (title) async {
                              await todoDb.update(id: todo.id, title: title);
                              getTodo();
                              if (!mounted) return;
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                    );
                  },
                  itemCount: todos.length);
        },
      ),
    );
  }
}
