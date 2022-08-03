import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../provider/todos.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          key: UniqueKey(),
          startActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: null,
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => deleteTodo(context, todo),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if (todo.description.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    todo.description,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }
}
