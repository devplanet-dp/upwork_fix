import 'package:shared_preferences/shared_preferences.dart';

const String PAGE_KEY = 'PAGE_KEY';

class SharedPreferenceHelper {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<int> get lastPage async {
    return _sharedPreference.then((preference) {
      return preference.getInt(PAGE_KEY)??0;
    });
  }

  Future<void> saveLastPage(int page) async {
    return _sharedPreference.then((preference) {
      preference.setInt(PAGE_KEY, page);
    });
  }
}
