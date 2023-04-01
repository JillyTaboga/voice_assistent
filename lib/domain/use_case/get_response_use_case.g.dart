// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_response_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getResponseUseCaseHash() =>
    r'78427bd99e947651d8de9f18547048d1f7f20c0a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetResponseUseCaseRef = AutoDisposeFutureProviderRef<ChatEntry>;

/// See also [getResponseUseCase].
@ProviderFor(getResponseUseCase)
const getResponseUseCaseProvider = GetResponseUseCaseFamily();

/// See also [getResponseUseCase].
class GetResponseUseCaseFamily extends Family<AsyncValue<ChatEntry>> {
  /// See also [getResponseUseCase].
  const GetResponseUseCaseFamily();

  /// See also [getResponseUseCase].
  GetResponseUseCaseProvider call(
    String message,
  ) {
    return GetResponseUseCaseProvider(
      message,
    );
  }

  @override
  GetResponseUseCaseProvider getProviderOverride(
    covariant GetResponseUseCaseProvider provider,
  ) {
    return call(
      provider.message,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getResponseUseCaseProvider';
}

/// See also [getResponseUseCase].
class GetResponseUseCaseProvider extends AutoDisposeFutureProvider<ChatEntry> {
  /// See also [getResponseUseCase].
  GetResponseUseCaseProvider(
    this.message,
  ) : super.internal(
          (ref) => getResponseUseCase(
            ref,
            message,
          ),
          from: getResponseUseCaseProvider,
          name: r'getResponseUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getResponseUseCaseHash,
          dependencies: GetResponseUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetResponseUseCaseFamily._allTransitiveDependencies,
        );

  final String message;

  @override
  bool operator ==(Object other) {
    return other is GetResponseUseCaseProvider && other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
