import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/providers/counter_state_provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    return Center(
      child: Text(
        "Counter: $counter",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 32,
        ),
      ),
    );
  }
}
