import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController=PageController(initialPage: 0);
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(elevation: 0.0,
      backgroundColor: Colors.white,
      actions: [
        Padding(padding: const EdgeInsets.only(right: 20,top: 20),
        child: InkWell(
          onTap: ()=>null,//to login screen
          child: const Text("Skip",style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight:FontWeight.w400),),
        ),)
      ],
      title:const Text("onboardingscreen"),),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
              currentindex=page;
              });
            },
            controller: _pageController,
            children: [
              Container(
                padding:const EdgeInsets.only(right: 50,left: 50,bottom: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 380,child:Image.asset("lib/images/2.png"),),
                    const SizedBox(height: 20,),
                    Text(Constants.titleOne,textAlign: TextAlign.center,style: TextStyle(color:Constants.primagyColor),),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}