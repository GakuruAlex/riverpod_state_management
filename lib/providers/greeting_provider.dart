import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/services/fake_api.dart';

final fakeApiProvider = Provider((_) => FakeApiService());

final greetingFutureProvider = FutureProvider<String>((Ref ref) async {
  print("Provider executed");
  final fakeService = ref.read(fakeApiProvider);

  return await fakeService.getGreeting();
});
