import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:try_flutter/model/todo_api_model.dart';
import 'package:try_flutter/model/todo_model.dart';

class CreateTodoWidget extends StatefulWidget {
  final TodoModel? todo;
  final TodoApiModel? todoApi;
  final ValueChanged<String> onSubmit;
  const CreateTodoWidget(
      {Key? key, this.todo, this.todoApi, required this.onSubmit})
      : super(key: key);

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    controller.text = widget.todo?.title ?? '';
    controller.text = widget.todoApi?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.todo != null || widget.todoApi != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Todo' : 'Add Todo'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel')),
        TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(controller.text);
              }
            },
            child: const Text("submit"))
      ],
    );
  }
}
