

 import 'package:book_store/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
   const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller=PageController(initialPage:0 );

   @override

   Widget build(BuildContext context) {
     return Scaffold(
       body:
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
           child: Column(
             crossAxisAlignment:CrossAxisAlignment.end,
             children: [
               TextButton(onPressed: (){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));

               }, child: Text("Skip")),
               SizedBox(height: 100,),
               Expanded(child: PageView(
                 controller: controller,
       children: [
         PageViewItem(image: 'https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg',title: "Hi Start To Read",suptitle: "Hi Ghada",),
         PageViewItem(image: "https://img.freepik.com/free-vector/e-learnign-design-yellow-background_1200-244.jpg",title: "Search on your Book",suptitle: "BOOKS",),
         PageViewItem(image: "https://img.freepik.com/free-vector/boy-reading-by-window_1308-175247.jpg",title:"Show Your Books",suptitle:"Books for you"),

],
               ))

               ,Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SmoothPageIndicator(
                       controller: controller,  // PageController
                       count: 3,
                       effect: ExpandingDotsEffect(
                         dotHeight: 8,
                         dotWidth: 12,
                       ),  // your preferred effect
                       onDotClicked: (index){
                       }
                   )
                   ,InkWell(
                     onTap: (){
                       if(controller.page?.toInt()==2){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                       }
                       else{

                         controller.nextPage(duration: Duration(microseconds: 60), curve:Curves.easeIn);

                       }
                       },
                     child: CircleAvatar(
                       radius: 30,
                       child:Icon(Icons.arrow_forward),
                     ),
                   )
                 ],
               )
             ],
           ),
           
         )
     );
   }
}
class PageViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String suptitle;
  const PageViewItem({super.key, required this.image, required this.title, required this.suptitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(image),
        Text(title),
        Text(suptitle),

      ],
    );
  }
}
