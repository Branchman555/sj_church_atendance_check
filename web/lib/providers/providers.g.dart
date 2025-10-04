// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiBaseUrl)
const apiBaseUrlProvider = ApiBaseUrlProvider._();

final class ApiBaseUrlProvider
    extends $FunctionalProvider<String, String, String> with $Provider<String> {
  const ApiBaseUrlProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'apiBaseUrlProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$apiBaseUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return apiBaseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$apiBaseUrlHash() => r'8505d18ec123c0c6647960f16a4ec65cabda0a41';

@ProviderFor(api)
const apiProvider = ApiProvider._();

final class ApiProvider
    extends $FunctionalProvider<ApiRepository, ApiRepository, ApiRepository>
    with $Provider<ApiRepository> {
  const ApiProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'apiProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$apiHash();

  @$internal
  @override
  $ProviderElement<ApiRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiRepository create(Ref ref) {
    return api(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiRepository>(value),
    );
  }
}

String _$apiHash() => r'75f0e07b16ba17b7bb1b7f01ef2fb74fed0b9af0';

@ProviderFor(AuthToken)
const authTokenProvider = AuthTokenProvider._();

final class AuthTokenProvider extends $NotifierProvider<AuthToken, String?> {
  const AuthTokenProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authTokenProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authTokenHash();

  @$internal
  @override
  AuthToken create() => AuthToken();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$authTokenHash() => r'c5e7e1aafee724bb5a49ec455a4da81c8fd2087f';

abstract class _$AuthToken extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(LoginState)
const loginStateProvider = LoginStateProvider._();

final class LoginStateProvider extends $NotifierProvider<LoginState, bool> {
  const LoginStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginStateHash();

  @$internal
  @override
  LoginState create() => LoginState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loginStateHash() => r'4967007e9e92fc93a1040ea57b7204ec3d087d8a';

abstract class _$LoginState extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Profile)
const profileProvider = ProfileProvider._();

final class ProfileProvider
    extends $NotifierProvider<Profile, Map<String, dynamic>?> {
  const ProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  Profile create() => Profile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, dynamic>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, dynamic>?>(value),
    );
  }
}

String _$profileHash() => r'd38400b8fb6aa2717f3fc74f8c683304c8c681a9';

abstract class _$Profile extends $Notifier<Map<String, dynamic>?> {
  Map<String, dynamic>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, dynamic>?, Map<String, dynamic>?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Map<String, dynamic>?, Map<String, dynamic>?>,
        Map<String, dynamic>?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(NoticeDismissed)
const noticeDismissedProvider = NoticeDismissedProvider._();

final class NoticeDismissedProvider
    extends $NotifierProvider<NoticeDismissed, bool> {
  const NoticeDismissedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeDismissedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticeDismissedHash();

  @$internal
  @override
  NoticeDismissed create() => NoticeDismissed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$noticeDismissedHash() => r'c175590d09e90638bc45a9a472b4f85829ca9169';

abstract class _$NoticeDismissed extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
