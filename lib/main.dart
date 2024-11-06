//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/authentication/login.dart';
import 'package:to_do/authentication/signUp.dart';
import 'package:to_do/provider/tasksProvider.dart';
import 'package:to_do/splash.dart';
import 'package:to_do/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //runApp(SignupPage());

//FirebaseFirestore.instance.disableNetwork();

  runApp(
      ChangeNotifierProvider(create: (_) => TasksProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        '/homePage': (context) => MyHomePage(),
        SignupPage.routeName: (context) => SignupPage(),
        LoginPage.routeName: (context) => LoginPage()
      },
      initialRoute: LoginPage.routeName,
    );
  }
}
