import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_state_management/providers/todos_provider.dart';

import '../widgets/todos_list.dart';

class TodosScreen extends ConsumerStatefulWidget {
  const TodosScreen({super.key});
  @override
  ConsumerState<TodosScreen> createState() {
    return _TodosScreenState();
  }
}

class _TodosScreenState extends ConsumerState<TodosScreen> {
  late TextEditingController _titleController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    final todos = ref.watch(todoStateNotifierProvider);
    final todosNotifier = ref.read(todoStateNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(40),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.9,
        width: MediaQuery.sizeOf(context).width * 0.90,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                    controller: _titleController,
                  ),
                ),
                SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    todosNotifier.newTodo(_titleController.text);
                    _titleController.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 30),
            todos.isEmpty
                ? Text(
                    "No todos yet. Add some.",
                    style: TextStyle(fontSize: 32),
                  )
                : TodosList(todosNotifier: todosNotifier, todos: todos),
          ],
        ),
      ),
    );
  }
}
