import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rockpaperscissor/constant.dart';
import 'package:rockpaperscissor/views/result_screen.dart';
import 'package:rockpaperscissor/widgets/round_button.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  var roundNumber = 1;
  var userScore = 0;
  var computerScore = 0;
  var imageArray = ['Rock', 'Paper', 'Scissor'];
  var computerRandomNumber = 0;
  var userOption = 0;
  String resultText = "Welcome! Lets Start";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text('Round ${roundNumber}', style: titleTextStyle,textAlign: TextAlign.center,)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/anime_avatar.jpg'),
                            ),
                            shape: BoxShape.circle
                          ),
                        ),
                        Text('Points: ${userScore} / 5', style: scoreTextStyle,)
                      ],
                    ),
                    Text('User', style: scoreTextStyle),

                    Text('/', style: titleTextStyle.copyWith(fontSize: 50)),
                    Text('PC', style: scoreTextStyle),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/anime_avatar.jpg'),
                              ),
                              shape: BoxShape.circle
                          ),
                        ),
                        Text('Points: ${computerScore} / 5', style: scoreTextStyle,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${resultText}', style: titleTextStyle.copyWith(fontSize: 25),),
              ),

              SizedBox(height: 75,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/${imageArray[userOption]}.png', width: 150, fit: BoxFit.fitWidth,),
                  Container(width: 2, color: blackColour, height: 100, ),
                  Image.asset('images/${imageArray[computerRandomNumber]}.png', width: 150, fit: BoxFit.fitWidth,)

                ],
              ),
              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customRoundButton(context, getWidth(context) / 3.5, 50, "Rock", 18, Colors.white, blackColour, (){
                    setState(() {
                      computerOption(0);


                    });
                  }),
                  customRoundButton(context, getWidth(context) / 3.5, 50, "Paper", 18, Colors.white, blackColour, (){
                    setState(() {
                      computerOption(1);


                    });

                  }),
                  customRoundButton(context, getWidth(context) / 3.5, 50, "Scissor", 18, Colors.white, blackColour, (){
                    setState(() {
                      computerOption(2);

                    });
                  }),

                ],
              )

            ],
          ),
        ),
      ),
    );

  }
  void computerOption(int userInput){
//    0 = Rock, 1 = Paper, 2 = Scissor
          userOption = userInput;
          computerRandomNumber= Random().nextInt(3);

          if(userOption == 0 && computerRandomNumber == 0){
            //Tie
            resultText = "Tie";
            score(0);

          }else if(userOption == 0 && computerRandomNumber == 1){
            // Computer Wins
            resultText = "Computer Won! Try Again";
            score(2);



          } else if(userOption == 0 && computerRandomNumber == 2){
            // User Wins
            resultText = "You Won";
            score(1);


          } else if(userOption == 1 && computerRandomNumber == 0){
            // User Wins
            resultText = "You Won";
            score(1);


          } else if(userOption == 1 && computerRandomNumber == 1){
            //tie
            resultText = "Tie";
            score(0);


          } else if(userOption == 1 && computerRandomNumber == 2){
            //computer wins
            resultText = "Computer Won! Try Again";
            score(2);


          } else if(userOption == 2 && computerRandomNumber == 0){
            // computer wins
            resultText = "Computer Won! Try Again";
            score(2);


          } else if(userOption == 2 && computerRandomNumber == 1){
            // User Wins
            resultText = "You Won";
            score(1);


          } else if(userOption == 2 && computerRandomNumber == 2){
            //tie
            resultText = "Tie";
            score(0);


          }
  }


  void score(int number){
    // 0 == tie 1 = user wins 2 = computer wins
    setState(() {
      if(roundNumber < 4){
        if(number == 1){
          userScore += 1;
        }else if(number == 2){
          computerScore += 1;
        }

      }else if(roundNumber == 4){
        resultText = "last Round";


      }else{
        userScore = 0;
        computerScore = 0;
        roundNumber = 0;

        if(computerScore > userScore ){
          resultText = "Computer Won This Block";
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(userWon: false)));
        }else{
          resultText = "User Won This Block";
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(userWon: true)));

        }
      }
      roundNumber += 1;

    });

  }
}
