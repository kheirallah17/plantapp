import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/login_page.dart';
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
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const login()));
          },//to login screen
          child: const Text("Skip",style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight:FontWeight.w400),),
        ),)
      ],),
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
              createPage(image:'lib/images/2.png',
              title:Constants.titleOne,
              description: Constants.descriptionOne,),
              createPage(image:'lib/images/1.png',
              title:Constants.titleTwo,
              description: Constants.descriptionTwo,),
              createPage(image:'lib/images/3.png',
              title:Constants.titleThree,
              description: Constants.descriptionThree,),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _BuildIndicator(),
            ),),
            Positioned(
              bottom: 60,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                   decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primagyColor,

                   ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      if(currentindex<2){
                        currentindex++;
                      }
                      if(currentindex<3){
                        _pageController.nextPage(duration:const Duration(milliseconds: 300), curve: Curves.easeIn);
                      }else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const login()));
                      }
                    });
                  },
                   icon:const Icon(Icons.arrow_forward_ios,size:24,color: Colors.white,),),
              ),),
        ],
      ),
    );
  }
 // extra widgets
 
  //create the indicator decoration widget
Widget _indicator(bool isActive){
  return AnimatedContainer(duration: const Duration(milliseconds: 300),
  height: 10.0,
  width: isActive ?20 :8,
  margin: const EdgeInsets.only(right: 5.0),
  decoration: BoxDecoration(
    color: Constants.primagyColor,
    borderRadius: BorderRadius.circular(5),
  ),
  );
}
// create the indicator list 
List<Widget> _BuildIndicator(){
  List<Widget> indicators=[];
  for(int i=0;i<3;i++){
    if(currentindex==i){
      indicators.add(_indicator(true));
    }else{
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const createPage({
    super.key, required this.image, required this.title, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(right: 50,left: 50,bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 380,child:Image.asset(image),),
          const SizedBox(height: 20,),
          Text(title,textAlign: TextAlign.center,style: TextStyle(color:Constants.primagyColor,fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          Text(description,textAlign: TextAlign.center,
          style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.grey),),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}

