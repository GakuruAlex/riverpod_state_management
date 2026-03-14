import 'dart:math';

class FakeApiService {
  Future<String> getGreeting() async {
    double failure = Random().nextDouble();
    await Future.delayed(const Duration(seconds: 2));
    if (failure < 0.8) {
      throw Exception('Failed to fetch Greeting');
    }

    return "Hello World from Async";
  }
}
