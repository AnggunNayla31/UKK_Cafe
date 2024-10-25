import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kasir_cafe/controllers/login_controller.dart';
import 'package:kasir_cafe/services/base_url.dart';

class MenuService {
  String baseUrl = "${baseUrlService().baseUrl}/api";

  Future getMenu() async {
    LoginController dataLogin = LoginController();
    final url = Uri.parse(baseUrl + "/menu");
    var token = await dataLogin.getDataLogin();
    final getLogin = await http.get(url,
    
    headers: {
      "authorization":"Bearer ${token!.access_token}",
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