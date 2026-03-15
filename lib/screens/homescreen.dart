import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/providers/page_provider.dart';
import 'package:riverpod_state_management/screens/todos_screen.dart';
import 'package:riverpod_state_management/widgets/counter_widget.dart';
import 'package:riverpod_state_management/widgets/greetings_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPage = ref.watch(pageProvider);
    final pageSelector = ref.read(pageProvider.notifier);
    Widget content = switch (selectedPage) {
      0 => CounterWidget(),
      1 => GreetingsWidget(),
      2 => TodosScreen(),
      _ => CounterWidget(),
    };
    Widget contentTitle = switch (selectedPage) {
      0 => Text("State Provider"),
      1 => Text("Future Provider"),
      2 => Text("State Notifier Provider"),
      _ => Text("State Provider"),
    };

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: contentTitle,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: content,
      //TodosScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconSize: 26,
        selectedLabelStyle: TextStyle(fontSize: 17),
        unselectedLabelStyle: TextStyle(
          fontSize: 17,
          color: Theme.of(context).colorScheme.onTertiaryFixed,
          fontStyle: FontStyle.italic,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "State Provider",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan_outlined),
            label: "Future Provider",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            label: "State Notifier",
          ),
        ],
        currentIndex: selectedPage,
        selectedItemColor: Theme.of(context).colorScheme.onTertiaryFixed,
        onTap: (page) => {pageSelector.state = page},
      ),
    );
  }
}
