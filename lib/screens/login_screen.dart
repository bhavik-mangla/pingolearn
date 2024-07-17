import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../theme.dart';
import '../utils/validators.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        title: const  Text('MyNews', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)

      ),
        backgroundColor: Colors.transparent,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: emailController,
              validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                // Here is key idea
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              controller: passwordController,
              obscureText: !_passwordVisible,
              validator: (value) =>
              value!.isEmpty ? 'Please enter a password' : null,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  String? validateEmail = Validators.validateEmail(emailController.text);
                  String? validatePassword = Validators.validatePassword(passwordController.text);

                  if(validateEmail != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(validateEmail)),
                    );
                    return;
                  }

                  if (validatePassword != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(validatePassword)),
                    );
                    return;
                  }
                  GlobalKey<State> dialogKey = GlobalKey<State>();
                  if (!context.mounted) return;
                  showDialog(

                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return  Dialog(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          key: dialogKey,
                          child:
                          const   Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                  );


                  await userProvider.signin(emailController.text.trim(), passwordController.text.trim(),dialogKey, context);

                },
                child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            ),
      const SizedBox(height: 10),
      RichText(
        text: TextSpan(

          children: [
            const TextSpan(
              text: 'New here? ',
              style: TextStyle(color: secondaryColor),
            ),
            TextSpan(
              text: 'Sign up',
              style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
            ),
          ],
        ),
      ),

      ],
        ),
      ),
    );
  }
}
