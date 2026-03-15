import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/providers/counter_state_provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    final counterN = ref.read(counterProvider.notifier);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Counter: $counter",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 32,
            ),
          ),
          SizedBox(height: 40),

          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: FloatingActionButton(
              onPressed: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => counterN.state++,
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () => counterN.state--,
                    icon: Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () => counterN.state = 0,
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
