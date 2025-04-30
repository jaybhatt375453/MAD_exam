import 'package:hive/hive.dart';

class LogService {
  Future<void> saveLogOffline(Map<String, dynamic> log) async {
    var box = await Hive.openBox('offline_logs');
    await box.add(log);
  }

  Future<List<Map>> getOfflineLogs() async {
    var box = await Hive.openBox('offline_logs');
    return box.values.cast<Map>().toList();
  }

  Future<void> clearLogs() async {
    var box = await Hive.openBox('offline_logs');
    await box.clear();
  }
}