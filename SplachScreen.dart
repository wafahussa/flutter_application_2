import 'package:flutter/material.dart';
import 'package:flutter_application_2/Start.dart';

// شاشة الـ Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // الانتقال تلقائيًا إلى شاشة "Start" بعد 3 ثواني
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Start()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child:
            Image.asset('assets/logo.png'), // شعار التطبيق في الـ Splash Screen
      ),
    );
  }
}
