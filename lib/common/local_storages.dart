import 'package:shared_preferences/shared_preferences.dart';

final class LocalStorages {
  // static final LocalStorages _instance = LocalStorages._internal();
  // factory LocalStorages() => _instance;
  LocalStorages._internal();

  static SharedPreferences? _shared;
  static SharedPreferences get shared => _shared!;

  static Future<SharedPreferences> ensureInitialized() async {
    if (_shared == null) {
      SharedPreferences.setPrefix("top.sendbox");
      _shared = await SharedPreferences.getInstance();
    }
    return _shared!;
  }

  static remove(String key) => _shared?.remove(key);

  /// 封装通用的 put 方法，支持多种类型存储
  static void put(String key, dynamic value) {
    if (value is String) {
      _shared!.setString(key, value);
    } else if (value is int) {
      _shared!.setInt(key, value);
    } else if (value is double) {
      _shared!.setDouble(key, value);
    } else if (value is bool) {
      _shared!.setBool(key, value);
    } else if (value is List<String>) {
      _shared!.setStringList(key, value);
    } else {
      _shared!.setString(key, value.toString());
    }
  }

  /// 获取 String 类型的值
  static String? getString(String key) {
    return _shared?.getString(key);
  }

  /// 获取 int 类型的值
  static int? getInt(String key) {
    return _shared?.getInt(key);
  }

  /// 获取 double 类型的值
  static double? getDouble(String key) {
    return _shared?.getDouble(key);
  }

  /// 获取 bool 类型的值
  static bool? getBool(String key) {
    return _shared?.getBool(key);
  }

  /// 获取 StringList 类型的值
  static List<String>? getStringList(String key) {
    return _shared?.getStringList(key);
  }
}
