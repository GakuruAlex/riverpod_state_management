import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/providers/greeting_provider.dart';

class GreetingsScreen extends ConsumerWidget {
  const GreetingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Using Future Provider"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: greeting.when(
          data: (result) => Text(result, style: TextStyle(fontSize: 32)),
          loading: () => const CircularProgressIndicator(),

          error: (err, stackTrace) => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                err.toString(),
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(greetingFutureProvider);
                },
                child: const Text("Retry", style: TextStyle(fontSize: 32)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
