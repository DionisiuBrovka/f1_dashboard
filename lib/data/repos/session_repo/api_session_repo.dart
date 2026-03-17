import 'package:dio/dio.dart';
import 'package:f1_dashboard/data/models/session.dart';
import 'package:f1_dashboard/data/repos/session_repo/session_repo.dart';
import 'package:hive/hive.dart';

class ApiSessionRepo extends SessionRepo {
  final String _apiUrl = 'https://api.openf1.org/v1/sessions';
  final _dio = Dio();

  final _box = Hive.box(name: 'cache');

  @override
  Future<List<Session>> getSessions(int year) async {
    if (_box.isNotEmpty) {
      final cache = _box.get('sessions') as List<dynamic>;
      final List<Session> data = cache.map((e) => Session.fromJson(e)).toList();
      return data;
    } else {
      final response = await _dio.get('$_apiUrl?year=$year');
      final data = (response.data as List)
          .map((e) => Session.fromJson(e))
          .toList();
      _box.put('sessions', data);
      return data;
    }
  }
}
