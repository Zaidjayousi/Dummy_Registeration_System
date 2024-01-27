import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegisteredCoursesRecord extends FirestoreRecord {
  RegisteredCoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _courseRef = snapshotData['courseRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('registered_courses')
          : FirebaseFirestore.instance.collectionGroup('registered_courses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('registered_courses').doc(id);

  static Stream<RegisteredCoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegisteredCoursesRecord.fromSnapshot(s));

  static Future<RegisteredCoursesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegisteredCoursesRecord.fromSnapshot(s));

  static RegisteredCoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegisteredCoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegisteredCoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegisteredCoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegisteredCoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegisteredCoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegisteredCoursesRecordData({
  DocumentReference? courseRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'courseRef': courseRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegisteredCoursesRecordDocumentEquality
    implements Equality<RegisteredCoursesRecord> {
  const RegisteredCoursesRecordDocumentEquality();

  @override
  bool equals(RegisteredCoursesRecord? e1, RegisteredCoursesRecord? e2) {
    return e1?.courseRef == e2?.courseRef;
  }

  @override
  int hash(RegisteredCoursesRecord? e) =>
      const ListEquality().hash([e?.courseRef]);

  @override
  bool isValidKey(Object? o) => o is RegisteredCoursesRecord;
}
