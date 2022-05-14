import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Views/about_page.dart';
import 'package:flutter_app/Views/register_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget
{
  static const String routeName = 'login_page';

  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  final _storage = const FlutterSecureStorage();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  Future<void> _insert() async
  {
    await _storage.write(
      key: 'user',
      value: json.encode({'email': _emailController.text, 'password': _passwordController.text})
    );
  }

  void _submited() async
  {
    setState(() {
      _isLoading = true;
    });

    if(_emailController.text.isEmpty) {_cancelLoad();return;}
    if(_passwordController.text.isEmpty) {_cancelLoad();return;}
    if(_emailController.text != 'admin@admin.com') {_cancelLoad();return;}
    if(_passwordController.text != '12345678') {_cancelLoad();return;}

    await _insert();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
  }
  void _cancelLoad()
  {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'example@example.com',
                  labelText: 'Email',
                ),
                onChanged: (text){
                  setState(() {});
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                ),
                onChanged: (text){
                  setState(() {});
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child:  _isLoading ? 
                const  CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
                : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _submited();
                },
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Dont have account, ',
                    style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                    text: 'Register',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()))
                    }
                  ),
                ]
              ),
            )
          ],
        )
      ),
    );
  }
}