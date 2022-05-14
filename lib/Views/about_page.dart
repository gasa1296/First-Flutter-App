import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Views/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('AboutPage'),
      ),
      body: RichText(
        text: 
          TextSpan(
          text: 'logout',
          style: const TextStyle(
            color: Colors.black
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              await storage.deleteAll();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }
        ),
      )
    );
  }
}