import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MajorsRecord extends FirestoreRecord {
  MajorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "major_name" field.
  String? _majorName;
  String get majorName => _majorName ?? '';
  bool hasMajorName() => _majorName != null;

  // "major_hours" field.
  int? _majorHours;
  int get majorHours => _majorHours ?? 0;
  bool hasMajorHours() => _majorHours != null;

  // "major_school" field.
  DocumentReference? _majorSchool;
  DocumentReference? get majorSchool => _majorSchool;
  bool hasMajorSchool() => _majorSchool != null;

  void _initializeFields() {
    _majorName = snapshotData['major_name'] as String?;
    _majorHours = castToType<int>(snapshotData['major_hours']);
    _majorSchool = snapshotData['major_school'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('majors');

  static Stream<MajorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MajorsRecord.fromSnapshot(s));

  static Future<MajorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MajorsRecord.fromSnapshot(s));

  static MajorsRecord fromSnapshot(DocumentSnapshot snapshot) => MajorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MajorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MajorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MajorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MajorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMajorsRecordData({
  String? majorName,
  int? majorHours,
  DocumentReference? majorSchool,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'major_name': majorName,
      'major_hours': majorHours,
      'major_school': majorSchool,
    }.withoutNulls,
  );

  return firestoreData;
}

class MajorsRecordDocumentEquality implements Equality<MajorsRecord> {
  const MajorsRecordDocumentEquality();

  @override
  bool equals(MajorsRecord? e1, MajorsRecord? e2) {
    return e1?.majorName == e2?.majorName &&
        e1?.majorHours == e2?.majorHours &&
        e1?.majorSchool == e2?.majorSchool;
  }

  @override
  int hash(MajorsRecord? e) =>
      const ListEquality().hash([e?.majorName, e?.majorHours, e?.majorSchool]);

  @override
  bool isValidKey(Object? o) => o is MajorsRecord;
}
