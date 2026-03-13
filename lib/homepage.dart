import 'package:flutter/material.dart';
import 'package:riverpod_state_management/counter_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          "State Provider Tutorial",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: CounterWidget(),
      floatingActionButton: IconButton.filled(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          size: 48,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
