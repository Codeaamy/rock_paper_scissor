import 'package:flutter/material.dart';
import 'package:rockpaperscissor/constant.dart';
import 'package:rockpaperscissor/views/game_view.dart';
import 'package:rockpaperscissor/widgets/round_button.dart';

class InstructionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = getWidth(context);
    var height = getHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColour,
        title: Text('Instruction'),
      ),
      backgroundColor: yellowColour,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: Text('How to play RPS?', style: titleTextStyle)),
          ),
          Container(width: width - 20, height: 2, color: blackColour,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('''Although the game has a lot of complexity to it, the rules to play it are pretty simple.

The game is played where players deliver hand signals that will represent the elements of the game; rock, paper and scissors. The outcome of the game is determined by 3 simple rules:

    * Rock wins against scissors.
    * Scissors wins against paper.
    * Paper wins against rock.''',
     style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customRoundButton(context,width - 50 , 50,  "Lets Play",25.0 ,yellowColour, blackColour, (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GameView()));
            }),
          ),

        ],
      ),
      
    );
  }
}
