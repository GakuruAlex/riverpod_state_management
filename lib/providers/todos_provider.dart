import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_state_management/models/todo.dart';

final todoStateNotifierProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((_) {
      return TodosNotifier([]);
    });

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(super.state);

  void newTodo(String title) {
    state = [
      ...state,
      Todo(
        id: state.isEmpty ? 0 : state.last.id + 1,
        isCompleted: false,
        title: title,
      ),
    ];
  }

  void deleteTodo(int id) {
    state = state.where((currentTodo) => currentTodo.id != id).toList();
  }

  void completedTodo(int id) {
    var todos = [...state];

    int todoIndex = todos.indexWhere((t) => t.id == id);
    if (todoIndex == -1) return;
    Todo todo = state[todoIndex];
    todos[todoIndex] = todo.copyWith(isCompleted: !todo.isCompleted);
    state = todos;
  }
}
