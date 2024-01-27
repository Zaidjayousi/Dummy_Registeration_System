import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _school = prefs.getString('ff_school') ?? _school;
    });
    _safeInit(() {
      _major = prefs.getString('ff_major') ?? _major;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _school = '';
  String get school => _school;
  set school(String _value) {
    _school = _value;
    prefs.setString('ff_school', _value);
  }

  String _major = '';
  String get major => _major;
  set major(String _value) {
    _major = _value;
    prefs.setString('ff_major', _value);
  }

  final _getAllSchoolsManager = StreamRequestManager<List<SchoolsRecord>>();
  Stream<List<SchoolsRecord>> getAllSchools({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SchoolsRecord>> Function() requestFn,
  }) =>
      _getAllSchoolsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetAllSchoolsCache() => _getAllSchoolsManager.clear();
  void clearGetAllSchoolsCacheKey(String? uniqueKey) =>
      _getAllSchoolsManager.clearRequest(uniqueKey);

  final _getSchoolMajorsManager = StreamRequestManager<List<MajorsRecord>>();
  Stream<List<MajorsRecord>> getSchoolMajors({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MajorsRecord>> Function() requestFn,
  }) =>
      _getSchoolMajorsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetSchoolMajorsCache() => _getSchoolMajorsManager.clear();
  void clearGetSchoolMajorsCacheKey(String? uniqueKey) =>
      _getSchoolMajorsManager.clearRequest(uniqueKey);

  final _getRegisteredCoursesManager =
      StreamRequestManager<List<RegisteredCoursesRecord>>();
  Stream<List<RegisteredCoursesRecord>> getRegisteredCourses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<RegisteredCoursesRecord>> Function() requestFn,
  }) =>
      _getRegisteredCoursesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetRegisteredCoursesCache() => _getRegisteredCoursesManager.clear();
  void clearGetRegisteredCoursesCacheKey(String? uniqueKey) =>
      _getRegisteredCoursesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
