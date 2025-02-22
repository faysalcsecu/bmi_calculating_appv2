import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
    Timer(const Duration(seconds: 3), () {
      //for one time page view, no back button available in next page when use it
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent, // Border color
                  width: 4.0, // Border width
                ),
              ),
              child: ClipOval(
                // child: Image.asset(
                //   "assets/images/abc.png",
                //   fit: BoxFit.cover,
                // ),
                child: Image.network(
                  'https://www.shutterstock.com/image-vector/cartoon-illustration-bmi-vector-medical-260nw-2156738433.jpg', // Replace with actual URL
                  height: 150,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "BMI Calculating App",
              style: GoogleFonts.acme(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
