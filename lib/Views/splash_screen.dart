import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'about_page.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  final _storage = const FlutterSecureStorage();
  
  Future<void> _isLoged() async
  {
    String? jsonData = await _storage.read(key: 'user');
    if(jsonData != null){
      Map user = json.decode(jsonData);
      if(user['email'] == 'admin@admin.com')
      {
        await Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
      }
    }
    await Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  void initState()
  {
    super.initState();
    Timer(const Duration(seconds: 1), () async => {await _isLoged()});
  }

  @override
  Widget build(BuildContext context)
  {
    return Container();
  }
}