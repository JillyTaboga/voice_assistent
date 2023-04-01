// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatListHash() => r'a98d9f7364a7220395b575aaeecacf38bd145a82';

/// See also [ChatList].
@ProviderFor(ChatList)
final chatListProvider =
    AutoDisposeNotifierProvider<ChatList, List<ChatEntry>>.internal(
  ChatList.new,
  name: r'chatListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatList = AutoDisposeNotifier<List<ChatEntry>>;
String _$chatLoadingHash() => r'ba44f02fafd02286140ad6e91a149047a32955f4';

/// See also [ChatLoading].
@ProviderFor(ChatLoading)
final chatLoadingProvider =
    AutoDisposeNotifierProvider<ChatLoading, bool>.internal(
  ChatLoading.new,
  name: r'chatLoadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatLoading = AutoDisposeNotifier<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
