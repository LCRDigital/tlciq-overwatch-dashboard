import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitTypeReqRecord extends FirestoreRecord {
  UnitTypeReqRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RequirementID" field.
  int? _requirementID;
  int get requirementID => _requirementID ?? 0;
  bool hasRequirementID() => _requirementID != null;

  // "ProjectID" field.
  int? _projectID;
  int get projectID => _projectID ?? 0;
  bool hasProjectID() => _projectID != null;

  // "UnitTypeID" field.
  int? _unitTypeID;
  int get unitTypeID => _unitTypeID ?? 0;
  bool hasUnitTypeID() => _unitTypeID != null;

  // "ItemID" field.
  int? _itemID;
  int get itemID => _itemID ?? 0;
  bool hasItemID() => _itemID != null;

  // "RequiredQuantity" field.
  int? _requiredQuantity;
  int get requiredQuantity => _requiredQuantity ?? 0;
  bool hasRequiredQuantity() => _requiredQuantity != null;

  void _initializeFields() {
    _requirementID = castToType<int>(snapshotData['RequirementID']);
    _projectID = castToType<int>(snapshotData['ProjectID']);
    _unitTypeID = castToType<int>(snapshotData['UnitTypeID']);
    _itemID = castToType<int>(snapshotData['ItemID']);
    _requiredQuantity = castToType<int>(snapshotData['RequiredQuantity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unit_type_req');

  static Stream<UnitTypeReqRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UnitTypeReqRecord.fromSnapshot(s));

  static Future<UnitTypeReqRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UnitTypeReqRecord.fromSnapshot(s));

  static UnitTypeReqRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UnitTypeReqRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnitTypeReqRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnitTypeReqRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnitTypeReqRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnitTypeReqRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUnitTypeReqRecordData({
  int? requirementID,
  int? projectID,
  int? unitTypeID,
  int? itemID,
  int? requiredQuantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RequirementID': requirementID,
      'ProjectID': projectID,
      'UnitTypeID': unitTypeID,
      'ItemID': itemID,
      'RequiredQuantity': requiredQuantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class UnitTypeReqRecordDocumentEquality implements Equality<UnitTypeReqRecord> {
  const UnitTypeReqRecordDocumentEquality();

  @override
  bool equals(UnitTypeReqRecord? e1, UnitTypeReqRecord? e2) {
    return e1?.requirementID == e2?.requirementID &&
        e1?.projectID == e2?.projectID &&
        e1?.unitTypeID == e2?.unitTypeID &&
        e1?.itemID == e2?.itemID &&
        e1?.requiredQuantity == e2?.requiredQuantity;
  }

  @override
  int hash(UnitTypeReqRecord? e) => const ListEquality().hash([
        e?.requirementID,
        e?.projectID,
        e?.unitTypeID,
        e?.itemID,
        e?.requiredQuantity
      ]);

  @override
  bool isValidKey(Object? o) => o is UnitTypeReqRecord;
}
