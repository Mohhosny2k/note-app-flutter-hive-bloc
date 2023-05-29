import 'package:flutter/material.dart';







class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first = true;
  @override
  void didChangeDependencies() async {
    if (first) {
      first = false;
      await Future.delayed(Duration(seconds: 3), () async {
        Navigator.pushNamed(context, 'boarding');
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:kPrimaryColorTwo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
                  'assets/images/1.png',
                  height: 200,
                ),
              const  SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Text(
                      'Note Data',
                      //  textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                         ),
                    ),
                  ],
                ),
       
     
        ],
      ),
    );
  }
}
