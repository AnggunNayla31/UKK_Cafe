import 'dart:convert';

import 'package:kasir_cafe/controllers/login_controller.dart';
import 'package:kasir_cafe/services/base_url.dart';
import 'package:http/http.dart' as http;

class Meja {
  String baseUrl = "${baseUrlService().baseUrl}/api";
  Future mejaAvailable() async {
    LoginController dataLogin = LoginController();
    final url = Uri.parse("$baseUrl/table/available");
    var token = await dataLogin.getDataLogin();
    final getLogin = await http.get(url, headers: {
      "Authorization": "Bearer ${token!.access_token}",
      'makerID': baseUrlService().makerID
    });
    print(jsonDecode(getLogin.body));
    if (getLogin.statusCode == 200) {
      return jsonDecode(getLogin.body);
    } else {
      return null;
    }
  }
}
