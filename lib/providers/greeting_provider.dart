import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/services/fake_api.dart';

final fakeApiProvider = Provider((_) => FakeApiService());

final greetingFutureProvider = FutureProvider((Ref ref) async {
  ref.keepAlive();
  print("Provider executed");
  final fakeService = ref.read(fakeApiProvider);

  return fakeService.getGreeting();
});
