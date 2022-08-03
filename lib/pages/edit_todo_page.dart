import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/todos.dart';
import 'package:todo_list/widgets/todo_form_widget.dart';

import '../model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  //Using the late modifier i am promising dart that i would initialize the variable later
  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit todo'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.delete,
              ),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: TodoFormWidget(
            title: title,
            description: description,
            onChangedDescription: (description) => setState(
              (() => this.description = description),
            ),
            onChangedTitle: (title) => setState(() => this.title = title),
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        createdTime: DateTime.now(),
        title: title,
        id: DateTime.now().toString(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }
}
