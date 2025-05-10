
import '../services/local/shared_prefs_helper/prefs_keys.dart';
import '../services/local/shared_prefs_helper/shared_prefs_helper.dart';

class AppFuncations{

   static void saveUserToken (String token){
    SharedPrefsHelper.saveData(key: PrefsKeys.tokenKey, value:true);
  }

}