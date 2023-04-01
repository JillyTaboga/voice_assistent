// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_response_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getResponseUseCaseHash() =>
    r'936e6c32e34eb52f8de670e31a4822299a67bfc8';

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
    List<ChatEntry> entries,
  ) {
    return GetResponseUseCaseProvider(
      entries,
    );
  }

  @override
  GetResponseUseCaseProvider getProviderOverride(
    covariant GetResponseUseCaseProvider provider,
  ) {
    return call(
      provider.entries,
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
    this.entries,
  ) : super.internal(
          (ref) => getResponseUseCase(
            ref,
            entries,
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

  final List<ChatEntry> entries;

  @override
  bool operator ==(Object other) {
    return other is GetResponseUseCaseProvider && other.entries == entries;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entries.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
