import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffe8fde5),
      body:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("This is Landing Page", style: TextStyle(color: Color(
                    0xFF108322), fontWeight: FontWeight.bold, fontSize: 55)),
                Text("Login successfully done using Firebase Authentication ", style: TextStyle(color: Colors.grey, fontSize: 15)),



                SizedBox(
                  height: 100,
                ),
                Text("App under development", style: TextStyle(color: Colors.black45, fontSize: 25,fontWeight: FontWeight.bold),)
              ],
            ),
        ),

      );
  }
}
