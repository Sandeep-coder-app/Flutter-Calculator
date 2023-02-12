import 'package:calculator/Colors.dart';
import 'package:calculator/theme_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
   if(value == 'AC') {
     input = '';
     output = '';
   }
    else if(value == '<') {
      if(input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
   } else if(value == '=') {
      if(input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith(".0")) {
          output = output.substring(0,output.length-2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;
      }
   } else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
   }

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: _appBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding:const EdgeInsets.all(12),
             // color: themes.light,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                   hideInput?'': input,style: TextStyle(
                    fontSize: 48,
                    color: Colors.orange,
                  ),),

                 const SizedBox(
                    height: 20,
                  ),

                  Text(output,style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange.withOpacity(0.7),
                  ),),

                const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),



          Row(
            children: [
              Button(text: "AC",tcolor: orangeColor,bgColor: operatorColor),
              Button(text: "<",tcolor: orangeColor,bgColor: operatorColor),
              Button(text: "",bgColor: Colors.transparent),
              Button(text: "/",tcolor: orangeColor,bgColor: operatorColor)
            ],
          ),

          Row(
            children: [
              Button(text: "7"),
              Button(text: "8"),
              Button(text: "9"),
              Button(text: "*",tcolor: orangeColor,bgColor: operatorColor)
            ],
          ),

          Row(
            children: [
              Button(text: "4"),
              Button(text: "5"),
              Button(text: "6"),
              Button(text: "-",tcolor: orangeColor,bgColor: operatorColor)
            ],
          ),

          Row(
            children: [
              Button(text: "1"),
              Button(text: "2"),
              Button(text: "3"),
              Button(text: "+",tcolor: orangeColor,bgColor: operatorColor)
            ],
          ),

          Row(
            children: [
              Button(text: "%",tcolor: orangeColor,bgColor: operatorColor),
              Button(text: "0"),
              Button(text: ".",tcolor: orangeColor,bgColor: operatorColor),
              Button(text: "=",tcolor: orangeColor,bgColor: operatorColor)
            ],
          ),


        ],
      ),
    );
  }

  Widget Button({
    text, tcolor = Colors.white, bgColor = buttonColor,opColor = operatorColor
}) {
   return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(22),
                primary: bgColor),
            onPressed: () => onButtonClick(text),
            child:  Text(text,style: TextStyle(
              fontSize: 18, color: tcolor,fontWeight: FontWeight.bold,
            ),),
          ),
        )
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
        },
        child: Icon(Icons.nightlight_round,size: 20,),
      ),
      title: Text('Calculator',style: TextStyle(color: Colors.white)),
    );
  }
}

