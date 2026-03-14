import 'dart:math';

class FakeApiService {
  Future<String> getGreeting() async {
    double failure = Random().nextDouble();

    print("Failure is $failure");

    if (failure < 0.5) {
      print("THROWING ERROR");
      throw Exception('Failed to fetch Greeting');
    }
    await Future.delayed(const Duration(seconds: 2));

    return "Hello World from Async";
  }
}
