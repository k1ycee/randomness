import 'dart:convert';

import 'package:victory/model/auth_model.dart';

import 'package:http/http.dart' as http;

class Auth {
  final String url = "https://thawing-savannah-73858.herokuapp.com/auth";

  Future<AuthResponse> authenticate({String username, String password}) async {
    var kic = await http.post(
      url,
      body: jsonEncode(AuthRequest(password: password, username: username)),
      headers: {'Content-Type': "application/json"},
    );
    if(kic.statusCode == 200){
      // print(jsonDecode(kic.body));
      return AuthResponse.fromJson(jsonDecode(kic.body));
    }
    return null;
  }
}
