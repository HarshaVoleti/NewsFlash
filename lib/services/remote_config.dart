import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  static void setupConfig() {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.fetchAndActivate();
  }

  static String getString(String key) {
    return FirebaseRemoteConfig.instance.getString(key);
  }
}
