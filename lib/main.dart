import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/task_view.dart';
import 'viewmodels/task_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel()..loadTasks(),
      child: MaterialApp(
        title: 'Todo App (MVVM)',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskViewPage(),
      ),
    );
  }
}
