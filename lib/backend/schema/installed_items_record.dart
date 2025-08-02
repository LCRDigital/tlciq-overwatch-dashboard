import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstalledItemsRecord extends FirestoreRecord {
  InstalledItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "InstalledItemID" field.
  int? _installedItemID;
  int get installedItemID => _installedItemID ?? 0;
  bool hasInstalledItemID() => _installedItemID != null;

  // "UnitID" field.
  int? _unitID;
  int get unitID => _unitID ?? 0;
  bool hasUnitID() => _unitID != null;

  // "ItemID" field.
  int? _itemID;
  int get itemID => _itemID ?? 0;
  bool hasItemID() => _itemID != null;

  // "QuantityInstalled" field.
  int? _quantityInstalled;
  int get quantityInstalled => _quantityInstalled ?? 0;
  bool hasQuantityInstalled() => _quantityInstalled != null;

  // "PictureURL" field.
  String? _pictureURL;
  String get pictureURL => _pictureURL ?? '';
  bool hasPictureURL() => _pictureURL != null;

  // "InstallationStatus" field.
  String? _installationStatus;
  String get installationStatus => _installationStatus ?? '';
  bool hasInstallationStatus() => _installationStatus != null;

  void _initializeFields() {
    _installedItemID = castToType<int>(snapshotData['InstalledItemID']);
    _unitID = castToType<int>(snapshotData['UnitID']);
    _itemID = castToType<int>(snapshotData['ItemID']);
    _quantityInstalled = castToType<int>(snapshotData['QuantityInstalled']);
    _pictureURL = snapshotData['PictureURL'] as String?;
    _installationStatus = snapshotData['InstallationStatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('installed_items');

  static Stream<InstalledItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstalledItemsRecord.fromSnapshot(s));

  static Future<InstalledItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstalledItemsRecord.fromSnapshot(s));

  static InstalledItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstalledItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstalledItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstalledItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstalledItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstalledItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstalledItemsRecordData({
  int? installedItemID,
  int? unitID,
  int? itemID,
  int? quantityInstalled,
  String? pictureURL,
  String? installationStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'InstalledItemID': installedItemID,
      'UnitID': unitID,
      'ItemID': itemID,
      'QuantityInstalled': quantityInstalled,
      'PictureURL': pictureURL,
      'InstallationStatus': installationStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstalledItemsRecordDocumentEquality
    implements Equality<InstalledItemsRecord> {
  const InstalledItemsRecordDocumentEquality();

  @override
  bool equals(InstalledItemsRecord? e1, InstalledItemsRecord? e2) {
    return e1?.installedItemID == e2?.installedItemID &&
        e1?.unitID == e2?.unitID &&
        e1?.itemID == e2?.itemID &&
        e1?.quantityInstalled == e2?.quantityInstalled &&
        e1?.pictureURL == e2?.pictureURL &&
        e1?.installationStatus == e2?.installationStatus;
  }

  @override
  int hash(InstalledItemsRecord? e) => const ListEquality().hash([
        e?.installedItemID,
        e?.unitID,
        e?.itemID,
        e?.quantityInstalled,
        e?.pictureURL,
        e?.installationStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is InstalledItemsRecord;
}
