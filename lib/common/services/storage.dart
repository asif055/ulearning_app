import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async{
    return await _pref.setBool(key, value);
  }

  // getDeviceFirstOpen function => is used to show onBoarding screen for user first time open the app
  // and not show  second time , if user is already open it
  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null ? true:false;
  }
}
