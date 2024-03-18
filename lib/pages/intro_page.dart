import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thesushi/components/button.dart';


class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 50),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const SizedBox(height: 25,),
            //shop name
              Text('SUSHI MAN', style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 30
              )),

            // const SizedBox(height: ,),
            
            //icon
            // Padding(
            //   padding: const EdgeInsets.all(50),
            //   child: Image.network("https://cdn-icons-png.flaticon.com/128/3259/3259012.png"),
            // ),
            Container(
              width: double.infinity,
              height: 170,
              alignment: Alignment.center,

              child: Transform.scale(child: Image.network("https://cdn-icons-png.flaticon.com/128/3259/3259012.png",), scale: 1.6,),
            ),

            const SizedBox(height: 10,),
            //title

            Text('THE TASTE OF JAPANESE FOOD', style: GoogleFonts.dmSerifDisplay(
                color: Colors.white,
                fontSize: 44
            )),

            //subtitle
            Text(
              "Feel the taste of the most popolar Japanese food from anywhere and anytime", style:  TextStyle(
              color: Colors.grey[300],
              height: 2
            ),
            ),
            const SizedBox(height: 25,),
            //get started button
            
            MyButton(text: 'Get Started', onTap: (){
              Navigator.pushNamed(context, '/menupage');
            },)
          ],
        ),
      ),
    );
  }
}
