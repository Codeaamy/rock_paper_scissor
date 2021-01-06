import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rockpaperscissor/constant.dart';
import 'package:rockpaperscissor/views/game_view.dart';
import 'package:rockpaperscissor/widgets/round_button.dart';

class ResultScreen extends StatefulWidget {
   final bool userWon;

  const ResultScreen({Key key, this.userWon}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.userWon ? Text("Congratulation!!! You Won",style: titleTextStyle,):
              Text("Ahh!! Computer Won. Try Again", style: titleTextStyle,),

          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: customRoundButton(context, getWidth(context) - 50 , 50,  "Lets Play",25.0 ,yellowColour, blackColour, (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GameView()));
            }),
          ),
        ],
      ),
    );
  }
}
