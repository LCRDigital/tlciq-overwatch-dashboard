import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ItemID" field.
  int? _itemID;
  int get itemID => _itemID ?? 0;
  bool hasItemID() => _itemID != null;

  // "ProjectID" field.
  int? _projectID;
  int get projectID => _projectID ?? 0;
  bool hasProjectID() => _projectID != null;

  // "ItemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "ItemSKU" field.
  String? _itemSKU;
  String get itemSKU => _itemSKU ?? '';
  bool hasItemSKU() => _itemSKU != null;

  // "QtyPerBox" field.
  int? _qtyPerBox;
  int get qtyPerBox => _qtyPerBox ?? 0;
  bool hasQtyPerBox() => _qtyPerBox != null;

  void _initializeFields() {
    _itemID = castToType<int>(snapshotData['ItemID']);
    _projectID = castToType<int>(snapshotData['ProjectID']);
    _itemName = snapshotData['ItemName'] as String?;
    _itemSKU = snapshotData['ItemSKU'] as String?;
    _qtyPerBox = castToType<int>(snapshotData['QtyPerBox']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  int? itemID,
  int? projectID,
  String? itemName,
  String? itemSKU,
  int? qtyPerBox,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ItemID': itemID,
      'ProjectID': projectID,
      'ItemName': itemName,
      'ItemSKU': itemSKU,
      'QtyPerBox': qtyPerBox,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.itemID == e2?.itemID &&
        e1?.projectID == e2?.projectID &&
        e1?.itemName == e2?.itemName &&
        e1?.itemSKU == e2?.itemSKU &&
        e1?.qtyPerBox == e2?.qtyPerBox;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality()
      .hash([e?.itemID, e?.projectID, e?.itemName, e?.itemSKU, e?.qtyPerBox]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
