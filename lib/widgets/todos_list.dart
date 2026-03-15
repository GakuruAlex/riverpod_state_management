import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../providers/todos_provider.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    super.key,
    required this.todosNotifier,
    required this.todos,
  });

  final TodosNotifier todosNotifier;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (v) => todosNotifier.completedTodo(todos[index].id),
            ),
            title: Text(
              todos[index].title,
              style: TextStyle(
                decoration: todos[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: IconButton(
              onPressed: () => todosNotifier.deleteTodo(todos[index].id),
              icon: Icon(Icons.delete),
            ),
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}
