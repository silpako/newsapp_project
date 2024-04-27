import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp_project/controller/splashScreenController.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content goes here
            Text(
              "NEWS TODAY",
              style: GoogleFonts.abrilFatface(
                  fontSize: 30, color: Color.fromARGB(255, 210, 29, 29)),
            ),
            if (splashScreenProvider.isLoading)
              LottieBuilder.network(
                "https://lottiefiles.com/animations/free-download-brochure-DuC22rU6lB",
                fit: BoxFit.cover,
                repeat: true,
                height: 100,
                width: 100,
                
              )
          ],
        ),
      ),
    );
  }
}