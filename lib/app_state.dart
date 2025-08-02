import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _photoManager = StreamRequestManager<List<DealRecord>>();
  Stream<List<DealRecord>> photo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealRecord>> Function() requestFn,
  }) =>
      _photoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPhotoCache() => _photoManager.clear();
  void clearPhotoCacheKey(String? uniqueKey) =>
      _photoManager.clearRequest(uniqueKey);

  final _photo2Manager = StreamRequestManager<List<DealRecord>>();
  Stream<List<DealRecord>> photo2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealRecord>> Function() requestFn,
  }) =>
      _photo2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPhoto2Cache() => _photo2Manager.clear();
  void clearPhoto2CacheKey(String? uniqueKey) =>
      _photo2Manager.clearRequest(uniqueKey);

  final _notstartedManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> notstarted({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _notstartedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNotstartedCache() => _notstartedManager.clear();
  void clearNotstartedCacheKey(String? uniqueKey) =>
      _notstartedManager.clearRequest(uniqueKey);
}
