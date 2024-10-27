import 'dart:convert';

import 'package:kasir_cafe/controllers/login_controller.dart';
import 'package:kasir_cafe/services/base_url.dart';
import 'package:http/http.dart' as http;

class Pesan {
  Future simpanPesan(request) async {
    String baseUrl = "${baseUrlService().baseUrl}/api";
    LoginController dataLogin = LoginController();
    var token = await dataLogin.getDataLogin();
    final url = Uri.parse("$baseUrl/order");
    final getLogin = await http.post(url, body: jsonEncode(request), headers: {
      "Authorization": "Bearer ${token!.access_token}",
      'makerID': baseUrlService().makerID,
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    print(jsonDecode(getLogin.body));
    if (getLogin.statusCode == 200) {
      return jsonDecode(getLogin.body);
    } else {
      return null;
    }
  }
}
