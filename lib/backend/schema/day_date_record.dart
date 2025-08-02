import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayDateRecord extends FirestoreRecord {
  DayDateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DayID" field.
  int? _dayID;
  int get dayID => _dayID ?? 0;
  bool hasDayID() => _dayID != null;

  // "ProjectID" field.
  int? _projectID;
  int get projectID => _projectID ?? 0;
  bool hasProjectID() => _projectID != null;

  // "DayDate" field.
  DateTime? _dayDate;
  DateTime? get dayDate => _dayDate;
  bool hasDayDate() => _dayDate != null;

  void _initializeFields() {
    _dayID = castToType<int>(snapshotData['DayID']);
    _projectID = castToType<int>(snapshotData['ProjectID']);
    _dayDate = snapshotData['DayDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('day_date');

  static Stream<DayDateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DayDateRecord.fromSnapshot(s));

  static Future<DayDateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DayDateRecord.fromSnapshot(s));

  static DayDateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DayDateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DayDateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DayDateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DayDateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DayDateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDayDateRecordData({
  int? dayID,
  int? projectID,
  DateTime? dayDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DayID': dayID,
      'ProjectID': projectID,
      'DayDate': dayDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class DayDateRecordDocumentEquality implements Equality<DayDateRecord> {
  const DayDateRecordDocumentEquality();

  @override
  bool equals(DayDateRecord? e1, DayDateRecord? e2) {
    return e1?.dayID == e2?.dayID &&
        e1?.projectID == e2?.projectID &&
        e1?.dayDate == e2?.dayDate;
  }

  @override
  int hash(DayDateRecord? e) =>
      const ListEquality().hash([e?.dayID, e?.projectID, e?.dayDate]);

  @override
  bool isValidKey(Object? o) => o is DayDateRecord;
}
