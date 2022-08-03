import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Finish the job', description: ''' 
        - Learn a bit
        - Rest
        - Eat
        '''),
    Todo(createdTime: DateTime.now(), title: 'Buy Food', description: ''' 
        - Rice
        - Beans
        - Yam
        '''),
    Todo(createdTime: DateTime.now(), title: 'Code', description: '''
        - Tutorials
        - Lifesavers
        - Cryptowatch
        '''),
    Todo(createdTime: DateTime.now(), title: 'Visit Ola', description: '''
        - Talk about business
        - Get advice on training
      '''),
  ];
  //To make our list of todos public... the code below is a getter which is public and we make sure the ones that are not done yet are displayed where neccessary
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  void addTodo(Todo todo) {
    //now the todo we have added in the todo dialog, we want to add it to the list of todos avaiable
    _todos.add(todo);
    //then we notifyListeners,this brings about the rebuild in the UI
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
