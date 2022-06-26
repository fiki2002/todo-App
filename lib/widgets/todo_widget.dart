import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override

Widget build(BuildContext context) => Slidable(

  
  child: buildTodo(context),

);

  Widget buildTodo (BuildContext context) {
    return Container(
      color:  Colors.white,
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
          Expanded(
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
