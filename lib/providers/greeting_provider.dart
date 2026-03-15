import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/services/fake_api.dart';

final fakeApiProvider = Provider((_) => FakeApiService());

final greetingFutureProvider = FutureProvider((Ref ref) async {
  final fakeService = ref.read(fakeApiProvider);

  return await fakeService.getGreeting();
});
