import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in_example/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await authService.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome!'),
            SizedBox(height: 20),
            Text('User ID: ${authService.currentUser?.uid ?? 'N/A'}'),
            Text('Email: ${authService.currentUser?.email ?? 'N/A'}'),
            Text('Display Name: ${authService.currentUser?.displayName ?? 'N/A'}'),
            if (authService.currentUser?.photoURL != null)
              Image.network(authService.currentUser!.photoURL!),
          ],
        ),
      ),
    );
  }
}