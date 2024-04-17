import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'login.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), //default: SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen() : super();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashTransition: SplashTransition.decoratedBoxTransition,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
          Image.asset(
          'assets/gail-logo-7F9B1BEDC6-seeklogo.com.png',
          width: 500,
          height: 63,
          ),
          Spacer(),
          Text(
              'Gas Authority of India',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'OleoScript',
                  fontSize: 11,
                  color: Colors.white,
                     )
          )

          ]
        ),
        backgroundColor: Colors.grey.shade900,
        nextScreen: Login()); //Login()
  }
}