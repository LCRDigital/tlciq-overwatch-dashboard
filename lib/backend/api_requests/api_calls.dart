import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Xano Group Code

class XanoGroup {
  static String getBaseUrl({
    String? notStarted = 'Not Started',
    String? inProgress = 'In Progress',
    String? completed = 'Completed',
    dynamic projectStatusJson,
  }) =>
      'https://x3ak-5mlo-qcrk.n7d.xano.io/api:wmyehFIQ';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJSUzI1NiJ9.eyJ4YW5vIjp7ImRibyI6Im1hc3Rlcjp1c2VyIiwiaWQiOjc4MjE4LCJhY2Nlc3NfdG9rZW4iOnsia2V5aWQiOiI2ODFkYTM5ZS1iYzRlLTQ5MmUtODI0Yi00OTNjZWE0YTY0MzciLCJzY29wZSI6eyJ3b3Jrc3BhY2U6YWRkb24iOjE1LCJ3b3Jrc3BhY2U6YXBpIjoxNSwid29ya3NwYWNlOmNvbnRlbnQiOjE1LCJ3b3Jrc3BhY2U6ZGF0YWJhc2UiOjE1LCJ3b3Jrc3BhY2U6ZGF0YXNvdXJjZTpsaXZlIjoxNSwid29ya3NwYWNlOmZpbGUiOjE1LCJ3b3Jrc3BhY2U6ZnVuY3Rpb24iOjE1LCJ3b3Jrc3BhY2U6cmVxdWVzdGhpc3RvcnkiOjE1LCJ3b3Jrc3BhY2U6dGFzayI6MTV9fX0sImlhdCI6MTcxOTU5Mjg3NCwibmJmIjoxNzE5NTkyODc0LCJhdWQiOiJ4YW5vOm1ldGEifQ.dIdOSJ7zKKbeswbNQxxFF7m1m6hRLQs5puuluTA4qMIbp92foLJi1Iz7JGq8vS_0vsV3H3-TBqDkOx4iyy1_-20I32abi9GoJcdsRJUDNpW1V-6eSNOPxpMwngqtZgLoZXyRsMfvQia3Kqa5SUvKR41wKAgsmhQIoXrRO8j2JGRFL0Lc-PsEidD-5TzmksUBNk2cjfmXYzdRs_R_zhmNymXPOqXcRXDomA38J_hi71W3NZhR4HZUEJAnBYsW2MztTgWgdfb3fjvgMilx4kHQGLEAvnYbzrQyW1YV-q-VUKZOvqOKWWgkM7SrOh-1lh9BcWqYvERcxO1hFVbpg3wbMp6FHH8faaHw27uA3w5nMJR01z0zqxB2PPsu-9pFAD3mKF-d_DxB4_xZmN5vvmeSwy_o3BaY1Q7JXRHpn5_5CcmEdQ0OyattsPmm6biOPNorzEYhv1GoHHUoDP81ZO6jCtH9aoHBLic-rmekb9CN28CtYeyWh-y786JCL69XJEeT05kJw4GonF4Xtpg3ffcZiwXGGmSzqmZqHCzmm_OH-YhFdGsgq4atC8ae1eMY7wlILfMPhL5T2I4ZFAJ3dEcPLOZkFkKVnKm9kNXLM3emZiaeyylpiE1GyG16Q3cBcJDSC833zXbTwnOhcSlUohtExntElHbKAjuyLhkOTr_kLck',
    'Accept': 'application/json',
  };
  static DealNotStartedCall dealNotStartedCall = DealNotStartedCall();
}

class DealNotStartedCall {
  Future<ApiCallResponse> call({
    String? notStarted = 'Not Started',
    String? inProgress = 'In Progress',
    String? completed = 'Completed',
    dynamic projectStatusJson,
  }) async {
    final baseUrl = XanoGroup.getBaseUrl(
      notStarted: notStarted,
      inProgress: inProgress,
      completed: completed,
      projectStatusJson: projectStatusJson,
    );

    final projectStatus = _serializeJson(projectStatusJson);
    final ffApiRequestBody = '''
{
  "${projectStatus}": "${notStarted}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DealNotStarted',
      apiUrl: '${baseUrl}/deal_status',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiJ9.eyJ4YW5vIjp7ImRibyI6Im1hc3Rlcjp1c2VyIiwiaWQiOjc4MjE4LCJhY2Nlc3NfdG9rZW4iOnsia2V5aWQiOiI2ODFkYTM5ZS1iYzRlLTQ5MmUtODI0Yi00OTNjZWE0YTY0MzciLCJzY29wZSI6eyJ3b3Jrc3BhY2U6YWRkb24iOjE1LCJ3b3Jrc3BhY2U6YXBpIjoxNSwid29ya3NwYWNlOmNvbnRlbnQiOjE1LCJ3b3Jrc3BhY2U6ZGF0YWJhc2UiOjE1LCJ3b3Jrc3BhY2U6ZGF0YXNvdXJjZTpsaXZlIjoxNSwid29ya3NwYWNlOmZpbGUiOjE1LCJ3b3Jrc3BhY2U6ZnVuY3Rpb24iOjE1LCJ3b3Jrc3BhY2U6cmVxdWVzdGhpc3RvcnkiOjE1LCJ3b3Jrc3BhY2U6dGFzayI6MTV9fX0sImlhdCI6MTcxOTU5Mjg3NCwibmJmIjoxNzE5NTkyODc0LCJhdWQiOiJ4YW5vOm1ldGEifQ.dIdOSJ7zKKbeswbNQxxFF7m1m6hRLQs5puuluTA4qMIbp92foLJi1Iz7JGq8vS_0vsV3H3-TBqDkOx4iyy1_-20I32abi9GoJcdsRJUDNpW1V-6eSNOPxpMwngqtZgLoZXyRsMfvQia3Kqa5SUvKR41wKAgsmhQIoXrRO8j2JGRFL0Lc-PsEidD-5TzmksUBNk2cjfmXYzdRs_R_zhmNymXPOqXcRXDomA38J_hi71W3NZhR4HZUEJAnBYsW2MztTgWgdfb3fjvgMilx4kHQGLEAvnYbzrQyW1YV-q-VUKZOvqOKWWgkM7SrOh-1lh9BcWqYvERcxO1hFVbpg3wbMp6FHH8faaHw27uA3w5nMJR01z0zqxB2PPsu-9pFAD3mKF-d_DxB4_xZmN5vvmeSwy_o3BaY1Q7JXRHpn5_5CcmEdQ0OyattsPmm6biOPNorzEYhv1GoHHUoDP81ZO6jCtH9aoHBLic-rmekb9CN28CtYeyWh-y786JCL69XJEeT05kJw4GonF4Xtpg3ffcZiwXGGmSzqmZqHCzmm_OH-YhFdGsgq4atC8ae1eMY7wlILfMPhL5T2I4ZFAJ3dEcPLOZkFkKVnKm9kNXLM3emZiaeyylpiE1GyG16Q3cBcJDSC833zXbTwnOhcSlUohtExntElHbKAjuyLhkOTr_kLck',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? deal(dynamic response) => (getJsonField(
        response,
        r'''$[:].Deal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageBuilding(dynamic response) => (getJsonField(
        response,
        r'''$[:].ImageBuilding''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? projectStatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].Project_Status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? imageLogo(dynamic response) => getJsonField(
        response,
        r'''$[:].ImageLogo''',
        true,
      ) as List?;
  List<String>? project(dynamic response) => (getJsonField(
        response,
        r'''$[:].Project''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Xano Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
