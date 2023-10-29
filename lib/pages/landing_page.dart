import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}


class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "images/building.jpg",
                width: MediaQuery.of(context).size.width - 20, // Corrected the width calculation
                fit: BoxFit.cover,
              ),
            ),

            const Text("News from around the world for you", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, ),)
            

          ],
        ),
      ),
    );
  }
}
