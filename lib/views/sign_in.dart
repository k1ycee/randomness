import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:victory/constants/routes.dart';
import 'package:victory/model/auth_model.dart';
import 'package:victory/view_model/auth_view_model.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AuthViewModel>.withConsumer(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: MediaQuery.of(context).size.height * 0.05),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Text(
                  "Don't worry, this is not a secure authentication anything can be your username or password :)",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    focusColor: Colors.blueAccent,
                    hintText: 'Username',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    focusColor: Colors.blueAccent,
                    hintText: 'Password',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        model.authenticate(username: username.text, password: password.text);
                        Navigator.pushNamed(context, Paint);
                      },
                      child: Container(
                        child: Center(child: Text('SignIn', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
