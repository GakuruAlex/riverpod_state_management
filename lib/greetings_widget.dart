import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/providers/greeting_provider.dart';

class GreetingsWidget extends ConsumerWidget {
  const GreetingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Greetings Widget loaded");

    final greeting = ref.watch(greetingFutureProvider);

    return Center(
      child: greeting.when(
        data: (result) => Text(result, style: const TextStyle(fontSize: 32)),
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
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(greetingFutureProvider);
              },
              child: const Text("Retry", style: TextStyle(fontSize: 32)),
            ),
          ],
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
