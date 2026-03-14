import 'package:flutter/material.dart';
import 'package:riverpod_state_management/greetings_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using Future Provider"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: GreetingsWidget(),
    );
  }
}
