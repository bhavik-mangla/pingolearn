import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pingolearn/providers/country_code_provider.dart';
import 'package:pingolearn/theme.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CountryCodeProvider()),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: appTheme,

        home: const SplashScreen(),
      ),
    );
  }
}
