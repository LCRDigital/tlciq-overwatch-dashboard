import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DealRecord extends FirestoreRecord {
  DealRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "deal" field.
  String? _deal;
  String get deal => _deal ?? '';
  bool hasDeal() => _deal != null;

  // "project" field.
  String? _project;
  String get project => _project ?? '';
  bool hasProject() => _project != null;

  // "logo_photo_path" field.
  String? _logoPhotoPath;
  String get logoPhotoPath => _logoPhotoPath ?? '';
  bool hasLogoPhotoPath() => _logoPhotoPath != null;

  // "building_photo_path" field.
  String? _buildingPhotoPath;
  String get buildingPhotoPath => _buildingPhotoPath ?? '';
  bool hasBuildingPhotoPath() => _buildingPhotoPath != null;

  // "status" field.
  ProjectStatus? _status;
  ProjectStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  void _initializeFields() {
    _deal = snapshotData['deal'] as String?;
    _project = snapshotData['project'] as String?;
    _logoPhotoPath = snapshotData['logo_photo_path'] as String?;
    _buildingPhotoPath = snapshotData['building_photo_path'] as String?;
    _status = snapshotData['status'] is ProjectStatus
        ? snapshotData['status']
        : deserializeEnum<ProjectStatus>(snapshotData['status']);
    _endDate = snapshotData['end_date'] as DateTime?;
    _startDate = snapshotData['start_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deal');

  static Stream<DealRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DealRecord.fromSnapshot(s));

  static Future<DealRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DealRecord.fromSnapshot(s));

  static DealRecord fromSnapshot(DocumentSnapshot snapshot) => DealRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DealRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DealRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DealRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DealRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDealRecordData({
  String? deal,
  String? project,
  String? logoPhotoPath,
  String? buildingPhotoPath,
  ProjectStatus? status,
  DateTime? endDate,
  DateTime? startDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'deal': deal,
      'project': project,
      'logo_photo_path': logoPhotoPath,
      'building_photo_path': buildingPhotoPath,
      'status': status,
      'end_date': endDate,
      'start_date': startDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class DealRecordDocumentEquality implements Equality<DealRecord> {
  const DealRecordDocumentEquality();

  @override
  bool equals(DealRecord? e1, DealRecord? e2) {
    return e1?.deal == e2?.deal &&
        e1?.project == e2?.project &&
        e1?.logoPhotoPath == e2?.logoPhotoPath &&
        e1?.buildingPhotoPath == e2?.buildingPhotoPath &&
        e1?.status == e2?.status &&
        e1?.endDate == e2?.endDate &&
        e1?.startDate == e2?.startDate;
  }

  @override
  int hash(DealRecord? e) => const ListEquality().hash([
        e?.deal,
        e?.project,
        e?.logoPhotoPath,
        e?.buildingPhotoPath,
        e?.status,
        e?.endDate,
        e?.startDate
      ]);

  @override
  bool isValidKey(Object? o) => o is DealRecord;
}
