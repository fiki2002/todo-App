import 'package:flutter/material.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/widgets/todo_dialog.dart';
import 'package:todo_list/widgets/todo_list_widget.dart';

class MyTodoHomePage extends StatefulWidget {
  const MyTodoHomePage({Key? key}) : super(key: key);

  @override
  State<MyTodoHomePage> createState() => _MyTodoHomePageState();
}

class _MyTodoHomePageState extends State<MyTodoHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: 'Completed'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTodoDialogWidget(),
            barrierDismissible: false,
          );
        },
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
