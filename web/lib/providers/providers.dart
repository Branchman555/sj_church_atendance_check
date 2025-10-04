import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sj_ch_web/repository/api_repository.dart';

part 'providers.g.dart';

@riverpod
String apiBaseUrl(Ref ref) {
  return String.fromEnvironment('API_BASE_URL', defaultValue: 'http://localhost:3000');
}

@riverpod
ApiRepository api(Ref ref) {
  return ApiRepository(ref.watch(apiBaseUrlProvider));
}

@riverpod
class AuthToken extends _$AuthToken {
  @override
  String? build() {
    return null;
  }

  void set(String? token){
    state = token;
  }
}

@riverpod
class LoginState extends _$LoginState {
  @override
  bool build() {
    return false;
  }

  void set(bool loginState){
    state = loginState;
  }
}

@riverpod
class Profile extends _$Profile {
  @override
  Map<String, dynamic>? build() {
    return null;
  }

  void set(Map<String, dynamic>? json){
    state = json;
  }
}

@riverpod
class NoticeDismissed extends _$NoticeDismissed {
  @override
  bool build() {
    return false;
  }

  void set(bool value){
    state = value;
  }
}

//final authTokenProvider = StateProvider<String?>((ref) => null);

//final loginStateProvider = StateProvider<bool>((ref) => false);

//final profileProvider = StateProvider<Map<String, dynamic>?>((ref) => null);

// final noticeDismissedProvider = StateProvider<bool>((ref) {
//   // localStorage 연동은 웹 빌드에서 JS interop으로 붙이거나 shared_preferences_web 사용
//   return false;
// });
