import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getBackgroundColor(text1),
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Text(
              text1,
              style: TextStyle(
                color: getTextColor(text1),
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getBackgroundColor(text2),
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Text(
              text2,
              style: TextStyle(
                color: getTextColor(text2),
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getBackgroundColor(text3),
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(3), 
            child: Text(
              text3,
              style: TextStyle(
                color: getTextColor(text3),
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
            backgroundColor: getBackgroundColor(text4),
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Text(
              text4,
              style: TextStyle(
                color: getTextColor(text4),
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: backgroundGreyDark,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: backgroundGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getRow("ac", "ce", "%", "/"),
                      getRow("7", "8", "9", "*"),
                      getRow('4', '5', '6', '-'),
                      getRow('1', '2', '3', '+'),
                      getRow('00', '0', '.', '='),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isOperator(String text) {
    var operators = ["ac", "ce", "%", "/", "*", "-", "+", "="];

    for (var operator in operators) if (text == operator) return true;

    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOperator(text))
      return backgroundGreyDark;
    else
      return backgroundGrey;
  }

  Color getTextColor(String text) {
    if (isOperator(text))
      return textGreen;
    else
      return textGrey;
  }
}
