import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../theme.dart';
import '../utils/validators.dart';

class SignUpScreen extends StatefulWidget {
   const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   final TextEditingController emailController = TextEditingController();

   final  TextEditingController passwordController = TextEditingController();

   final TextEditingController nameController = TextEditingController();
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
        automaticallyImplyLeading: false,

        title: const  Text('MyNews', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)

        ),
        backgroundColor: Colors.transparent,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
             controller: nameController,
              validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
            ),  const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: emailController,
              validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
            ),  const SizedBox(height: 20),
            //password field with obscure text and eye icon
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

              validator: (value) => value!.isEmpty ? 'Please enter a password' : null,


            ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.25),
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

                //show circular progress dialog

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


                await userProvider.signup( emailController.text.trim(), passwordController.text.trim(), nameController.text.trim(),dialogKey, context);

              },
          child: const Text('Signup', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        ),
      ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(

                children: [
                  const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: secondaryColor),
                  ),
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pop(
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
