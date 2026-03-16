import 'package:dio/dio.dart';
import 'package:f1_dashboard/data/models/session.dart';
import 'package:f1_dashboard/data/repos/session_repo/session_repo.dart';

class ApiSessionRepo extends SessionRepo {
  final String _apiUrl = 'https://api.openf1.org/v1/sessions';

  List<Session> _items = [];
  final _dio = Dio();

  @override
  List<Session> get items => _items;

  @override
  Future<void> update(int year) async {
    final response = await _dio.get('$_apiUrl?year=$year');
    _items = (response.data as List).map((e) => Session.fromJson(e)).toList();
  }
}
