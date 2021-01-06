import 'package:flutter/material.dart';
import 'package:rockpaperscissor/constant.dart';
import 'package:rockpaperscissor/views/game_view.dart';
import 'package:rockpaperscissor/views/instruction_view.dart';
import 'package:rockpaperscissor/widgets/round_button.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfffcde79),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/RPS.png')
              )
            ),
          ),
          Positioned(
            top: 200,
              child: Text('Rock Paper Scissor',
                style: TextStyle(fontSize: 30, color: Color(0xff3a4645), fontWeight: FontWeight.bold) ,)
          ),
          Positioned(
              bottom: height * 0.25,
              child: customRoundButton(context,width - 50 , 50,  "Lets Play",25.0 ,yellowColour, blackColour, (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GameView()));
              }),
          ),

          Positioned(
            bottom: height * 0.2,
            child: GestureDetector(
                child: Text('Instruction', style: TextStyle(fontSize: 16, ),),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InstructionView()));
              },

            ),
          )

        ],
      ),
    );
  }
}
