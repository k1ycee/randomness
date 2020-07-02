import 'package:flutter/material.dart';
import 'package:victory/api/auth_api.dart';
import 'package:victory/constants/routes.dart';
import 'package:victory/model/auth_model.dart';
import 'package:victory/utils/navigator.dart';
import 'package:victory/views/custom_paints.dart';

class AuthViewModel extends ChangeNotifier{
  AuthResponse response = AuthResponse();

  Future<void> authenticate({String username, String password})async{
    var hap = await Auth().authenticate(username: username, password: password);
    response = hap;
    // print(hap.error);
    if(response.error == true){
      return "No username or Password";
    }
      // TODO: NAVIGATE USER TO NEWS PAGE
      // return "Successful";
    notifyListeners();
  }
}