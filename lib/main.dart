import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var userInput = '0';
  var result = '';

  setInputText(String text) {
    setState(() {
      if (userInput == '0' && text != '0') {
        userInput = '';
      }
      userInput = userInput + text;
    });
  }

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
          onPressed: () {
            if (text1 == "ac") {
              setState(() {
                userInput = '';
                result = '';
              });
            } else {
              setInputText(text1);
            }
          },
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
          onPressed: () {
            if (text2 == "ce") {
              if (userInput.length > 0) {
                setState(() {
                  userInput = userInput.substring(0, userInput.length - 1);
                });
              }
            } else
              setInputText(text2);
          },
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
          onPressed: () {
            setInputText(text3);
          },
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
          onPressed: () {
            if (text4 == "=") {
              Parser parser = Parser();
              Expression expression = parser.parse(userInput);
              ContextModel context = ContextModel();
              double eval = expression.evaluate(EvaluationType.REAL, context);

              setState(() {
                result = eval.toString();
              });
            } else {
              setInputText(text4);
            }
          },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          userInput,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: textGreen,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          result,
                          style: TextStyle(fontSize: 62, color: textGrey),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
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
