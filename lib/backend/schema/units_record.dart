import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitsRecord extends FirestoreRecord {
  UnitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UnitID" field.
  int? _unitID;
  int get unitID => _unitID ?? 0;
  bool hasUnitID() => _unitID != null;

  // "ProjectID" field.
  int? _projectID;
  int get projectID => _projectID ?? 0;
  bool hasProjectID() => _projectID != null;

  // "UnitNumber" field.
  String? _unitNumber;
  String get unitNumber => _unitNumber ?? '';
  bool hasUnitNumber() => _unitNumber != null;

  // "UnitTypeID" field.
  int? _unitTypeID;
  int get unitTypeID => _unitTypeID ?? 0;
  bool hasUnitTypeID() => _unitTypeID != null;

  // "DayID" field.
  int? _dayID;
  int get dayID => _dayID ?? 0;
  bool hasDayID() => _dayID != null;

  // "UnitStatus" field.
  String? _unitStatus;
  String get unitStatus => _unitStatus ?? '';
  bool hasUnitStatus() => _unitStatus != null;

  // "Floor" field.
  int? _floor;
  int get floor => _floor ?? 0;
  bool hasFloor() => _floor != null;

  // "NumberOfSKUs" field.
  int? _numberOfSKUs;
  int get numberOfSKUs => _numberOfSKUs ?? 0;
  bool hasNumberOfSKUs() => _numberOfSKUs != null;

  // "Startedby" field.
  DocumentReference? _startedby;
  DocumentReference? get startedby => _startedby;
  bool hasStartedby() => _startedby != null;

  // "StartedTime" field.
  DateTime? _startedTime;
  DateTime? get startedTime => _startedTime;
  bool hasStartedTime() => _startedTime != null;

  void _initializeFields() {
    _unitID = castToType<int>(snapshotData['UnitID']);
    _projectID = castToType<int>(snapshotData['ProjectID']);
    _unitNumber = snapshotData['UnitNumber'] as String?;
    _unitTypeID = castToType<int>(snapshotData['UnitTypeID']);
    _dayID = castToType<int>(snapshotData['DayID']);
    _unitStatus = snapshotData['UnitStatus'] as String?;
    _floor = castToType<int>(snapshotData['Floor']);
    _numberOfSKUs = castToType<int>(snapshotData['NumberOfSKUs']);
    _startedby = snapshotData['Startedby'] as DocumentReference?;
    _startedTime = snapshotData['StartedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('units');

  static Stream<UnitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UnitsRecord.fromSnapshot(s));

  static Future<UnitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UnitsRecord.fromSnapshot(s));

  static UnitsRecord fromSnapshot(DocumentSnapshot snapshot) => UnitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUnitsRecordData({
  int? unitID,
  int? projectID,
  String? unitNumber,
  int? unitTypeID,
  int? dayID,
  String? unitStatus,
  int? floor,
  int? numberOfSKUs,
  DocumentReference? startedby,
  DateTime? startedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UnitID': unitID,
      'ProjectID': projectID,
      'UnitNumber': unitNumber,
      'UnitTypeID': unitTypeID,
      'DayID': dayID,
      'UnitStatus': unitStatus,
      'Floor': floor,
      'NumberOfSKUs': numberOfSKUs,
      'Startedby': startedby,
      'StartedTime': startedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UnitsRecordDocumentEquality implements Equality<UnitsRecord> {
  const UnitsRecordDocumentEquality();

  @override
  bool equals(UnitsRecord? e1, UnitsRecord? e2) {
    return e1?.unitID == e2?.unitID &&
        e1?.projectID == e2?.projectID &&
        e1?.unitNumber == e2?.unitNumber &&
        e1?.unitTypeID == e2?.unitTypeID &&
        e1?.dayID == e2?.dayID &&
        e1?.unitStatus == e2?.unitStatus &&
        e1?.floor == e2?.floor &&
        e1?.numberOfSKUs == e2?.numberOfSKUs &&
        e1?.startedby == e2?.startedby &&
        e1?.startedTime == e2?.startedTime;
  }

  @override
  int hash(UnitsRecord? e) => const ListEquality().hash([
        e?.unitID,
        e?.projectID,
        e?.unitNumber,
        e?.unitTypeID,
        e?.dayID,
        e?.unitStatus,
        e?.floor,
        e?.numberOfSKUs,
        e?.startedby,
        e?.startedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is UnitsRecord;
}
