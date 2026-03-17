import 'package:f1_dashboard/data/models/session.dart';

abstract class SessionRepo {
  Future<List<Session>> getSessions(int year);
}
