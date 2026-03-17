import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:f1_dashboard/core/config.dart';
import 'package:f1_dashboard/data/models/session.dart';
import 'package:f1_dashboard/data/repos/session_repo/session_repo.dart';
import 'package:hive/hive.dart';

class ApiSessionRepo extends SessionRepo {
  final String _apiUrl = '${Config.baseApiUrl}/sessions';
  final _dio = Dio();
  final _box = Hive.box(name: 'cache-sessions');

  ApiSessionRepo() {
    log('init repo', name: 'api_session_repo');
  }

  @override
  Future<List<Session>> getSessions(int year) async {
    log('start geting repo', name: 'api_session_repo');
    final String yearTag = year.toString();
    List<Session>? data;

    if (_box.isNotEmpty) {
      log('cheak cache', name: 'api_session_repo');
      data = await _fetchFromCache(yearTag);
    }

    if (data == null) {
      log('cache empty', name: 'api_session_repo');
      data = await _fetchFromApi(yearTag);
      _loadCache(yearTag, data.map((e) => e.toJson()).toList());
    }

    log('returning ${data.length} items', name: 'api_session_repo');
    return data;
  }

  Future<void> _loadCache(
    String yearTag,
    List<Map<String, dynamic>> data,
  ) async {
    _box.put(yearTag, data);
  }

  Future<List<Session>?> _fetchFromCache(String yearTag) async {
    final cache = _box.get(yearTag) as List<dynamic>?;
    return cache?.map((e) => Session.fromJson(e)).toList();
  }

  Future<List<Session>> _fetchFromApi(String yearTag) async {
    final fullUrl = '$_apiUrl?year=$yearTag';

    log('calling api -> $fullUrl', name: 'api_session_repo');

    final response = await _dio.get(fullUrl);
    final data = (response.data as List)
        .map((e) => Session.fromJson(e))
        .toList();
    _box.put('sessions', data);
    return data;
  }
}
