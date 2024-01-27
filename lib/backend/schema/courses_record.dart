import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "output" field.
  String? _output;
  String get output => _output ?? '';
  bool hasOutput() => _output != null;

  // "schoolRef" field.
  DocumentReference? _schoolRef;
  DocumentReference? get schoolRef => _schoolRef;
  bool hasSchoolRef() => _schoolRef != null;

  // "majorRef" field.
  DocumentReference? _majorRef;
  DocumentReference? get majorRef => _majorRef;
  bool hasMajorRef() => _majorRef != null;

  // "registered" field.
  bool? _registered;
  bool get registered => _registered ?? false;
  bool hasRegistered() => _registered != null;

  void _initializeFields() {
    _output = snapshotData['output'] as String?;
    _schoolRef = snapshotData['schoolRef'] as DocumentReference?;
    _majorRef = snapshotData['majorRef'] as DocumentReference?;
    _registered = snapshotData['registered'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? output,
  DocumentReference? schoolRef,
  DocumentReference? majorRef,
  bool? registered,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'output': output,
      'schoolRef': schoolRef,
      'majorRef': majorRef,
      'registered': registered,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.output == e2?.output &&
        e1?.schoolRef == e2?.schoolRef &&
        e1?.majorRef == e2?.majorRef &&
        e1?.registered == e2?.registered;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality()
      .hash([e?.output, e?.schoolRef, e?.majorRef, e?.registered]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
