import 'package:flutter/material.dart';
import 'package:cafe_apps2go/src/app.dart';
import 'package:cafe_apps2go/src/widgets/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  /* SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light)); */
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Text('Error'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _MainApp();
        }

        return SplashScreen();
      },
    );
  }
}

class _MainApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafés Apps2Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(),
    );
  }
}