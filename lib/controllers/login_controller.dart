import 'dart:convert';

import 'package:kasir_cafe/models/user_login.dart';
import 'package:kasir_cafe/services/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_login.dart';

class LoginController {
  LoginService? loginServ = LoginService();
  Future loginAct(request) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final login = await loginServ!.loginAct(request);
    if (login != null) {
      // var data_user = jsonEncode(login);
      // print(login);
      prefs.setString("access_token", login["access_token"]);
      prefs.setString("name", login["user"]["user_name"]);
      prefs.setInt("id_user", login["user"]["user_id"]);
      prefs.setString("role", login["user"]["role"]);
      prefs.setBool("is_login", true);
      UserLogin data = UserLogin(
          status: true,
          id_user: login["user"]["id"],
          name: login["user"]["name"],
          role: login["user"]["role"],
          access_token: login["access_token"]);
      return data;
    } else {
      UserLogin data = UserLogin(
        status: false,
      );
      return data;
    }
  }

  Future<UserLogin?> getDataLogin() async {
    UserLogin user;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var is_login = prefs.getBool("is_login") == null ? false : true;
    // var data1;
    if (is_login) {
      user = UserLogin(
          access_token: prefs.getString("access_token"),
          id_user: prefs.getInt("id_user"),
          name: prefs.getString("name"),
          role: prefs.getString("role"),
          status: true);
    } else {
      user = UserLogin(status: false);
    }
    return user;
  }
}
