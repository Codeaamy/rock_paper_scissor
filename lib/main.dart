import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rockpaperscissor/views/welcome_view.dart';

void main() => runApp(RockPaperScissor());

class RockPaperScissor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeView(),
    );
  }
}
