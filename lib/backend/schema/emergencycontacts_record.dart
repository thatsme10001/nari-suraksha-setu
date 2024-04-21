import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmergencycontactsRecord extends FirestoreRecord {
  EmergencycontactsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "mobilenumber" field.
  int? _mobilenumber;
  int get mobilenumber => _mobilenumber ?? 0;
  bool hasMobilenumber() => _mobilenumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _mobilenumber = castToType<int>(snapshotData['mobilenumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emergencycontacts');

  static Stream<EmergencycontactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmergencycontactsRecord.fromSnapshot(s));

  static Future<EmergencycontactsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EmergencycontactsRecord.fromSnapshot(s));

  static EmergencycontactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmergencycontactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmergencycontactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmergencycontactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmergencycontactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmergencycontactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmergencycontactsRecordData({
  String? name,
  int? mobilenumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'mobilenumber': mobilenumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmergencycontactsRecordDocumentEquality
    implements Equality<EmergencycontactsRecord> {
  const EmergencycontactsRecordDocumentEquality();

  @override
  bool equals(EmergencycontactsRecord? e1, EmergencycontactsRecord? e2) {
    return e1?.name == e2?.name && e1?.mobilenumber == e2?.mobilenumber;
  }

  @override
  int hash(EmergencycontactsRecord? e) =>
      const ListEquality().hash([e?.name, e?.mobilenumber]);

  @override
  bool isValidKey(Object? o) => o is EmergencycontactsRecord;
}
