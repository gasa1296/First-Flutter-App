import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget
{
  static const String routeName = 'login_page';

  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;
  @override
  void initState()
  {
    super.initState();
  }

  void submited() async
  {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RegisterPage'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: TextField(
                controller: emailController,
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
                controller: passwordController,
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
                  submited();
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}