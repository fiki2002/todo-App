import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:todo_list/provider/todos.dart';

void main() => runApp(
    const  MyApp(),
    );

    class MyApp extends StatelessWidget {
      const MyApp({ Key? key }) : super(key: key);

      static const String title = 'Todo App';

      @override
      Widget build(BuildContext context) {
        return  ChangeNotifierProvider(
          create:(context) => TodosProvider(),
          child:  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.pink,
              scaffoldBackgroundColor:  const Color(0xfff6f5ee),
            ),
            title: title,
            home:  const  MyTodoHomePage(),
          ),
        );
      }
    }
