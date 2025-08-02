import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitTypesRecord extends FirestoreRecord {
  UnitTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UnitTypeID" field.
  int? _unitTypeID;
  int get unitTypeID => _unitTypeID ?? 0;
  bool hasUnitTypeID() => _unitTypeID != null;

  // "ProjectID" field.
  int? _projectID;
  int get projectID => _projectID ?? 0;
  bool hasProjectID() => _projectID != null;

  // "UnitTypeName" field.
  String? _unitTypeName;
  String get unitTypeName => _unitTypeName ?? '';
  bool hasUnitTypeName() => _unitTypeName != null;

  // "Count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  void _initializeFields() {
    _unitTypeID = castToType<int>(snapshotData['UnitTypeID']);
    _projectID = castToType<int>(snapshotData['ProjectID']);
    _unitTypeName = snapshotData['UnitTypeName'] as String?;
    _count = castToType<int>(snapshotData['Count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unit_types');

  static Stream<UnitTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UnitTypesRecord.fromSnapshot(s));

  static Future<UnitTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UnitTypesRecord.fromSnapshot(s));

  static UnitTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UnitTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnitTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnitTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnitTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnitTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUnitTypesRecordData({
  int? unitTypeID,
  int? projectID,
  String? unitTypeName,
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UnitTypeID': unitTypeID,
      'ProjectID': projectID,
      'UnitTypeName': unitTypeName,
      'Count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class UnitTypesRecordDocumentEquality implements Equality<UnitTypesRecord> {
  const UnitTypesRecordDocumentEquality();

  @override
  bool equals(UnitTypesRecord? e1, UnitTypesRecord? e2) {
    return e1?.unitTypeID == e2?.unitTypeID &&
        e1?.projectID == e2?.projectID &&
        e1?.unitTypeName == e2?.unitTypeName &&
        e1?.count == e2?.count;
  }

  @override
  int hash(UnitTypesRecord? e) => const ListEquality()
      .hash([e?.unitTypeID, e?.projectID, e?.unitTypeName, e?.count]);

  @override
  bool isValidKey(Object? o) => o is UnitTypesRecord;
}
