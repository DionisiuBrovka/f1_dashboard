import 'package:f1_dashboard/data/models/session.dart';

abstract class SessionRepo {
  List<Session> get items;

  Future<void> update(int year);
}
