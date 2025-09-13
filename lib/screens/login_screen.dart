import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in_example/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Sign in with Google'),
              onPressed: () async {
                await authService.signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}