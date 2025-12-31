import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextField(controller: email),
          TextField(controller: pass, obscureText: true),
          ElevatedButton(
            onPressed: () async {
              await AuthService().login(email.text, pass.text);
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
