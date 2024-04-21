import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MapRecord extends FirestoreRecord {
  MapRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('map');

  static Stream<MapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MapRecord.fromSnapshot(s));

  static Future<MapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MapRecord.fromSnapshot(s));

  static MapRecord fromSnapshot(DocumentSnapshot snapshot) => MapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMapRecordData({
  String? name,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class MapRecordDocumentEquality implements Equality<MapRecord> {
  const MapRecordDocumentEquality();

  @override
  bool equals(MapRecord? e1, MapRecord? e2) {
    return e1?.name == e2?.name && e1?.location == e2?.location;
  }

  @override
  int hash(MapRecord? e) => const ListEquality().hash([e?.name, e?.location]);

  @override
  bool isValidKey(Object? o) => o is MapRecord;
}
