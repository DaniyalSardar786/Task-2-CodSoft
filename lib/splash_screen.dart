import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              const Image(
                image: AssetImage("images/splash.png"),
                color: Colors.black,
                // image: NetworkImage(""),
                height: 300,
                width: 300,
              ),
              const SizedBox(height: 150,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 7
                      )
                    ]
                  ),
                  child: const Center(
                    child: Text("Let's Go!!",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26
                    ),),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
