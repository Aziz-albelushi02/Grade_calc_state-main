import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Grade = '';

  String Cal(double Grade) {
    if (Grade >= 100) {
      return "S+";
    } else if (Grade >= 95) {
      return "S";
    } else if (Grade >= 90) {
      return "A+";
    } else if (Grade >= 85) {
      return "B+";
    } else if (Grade >= 80) {
      return "B-";
    } else if (Grade >= 75) {
      return "=C+";
    } else if (Grade >= 70) {
      return "C-";
    } else if (Grade >= 65) {
      return "D+";
    } else if (Grade >= 60) {
      return "D-";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    var inputController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    // percentage text
                    Text(
                      "  %",
                      style: TextStyle(
                          fontSize: 55,
                          color: Color.fromARGB(255, 96, 85, 197),
                          fontWeight: FontWeight.bold),
                    ),
                    // text field
                    Container(
                        width: 500,
                        child: TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                              hintText:
                                  "                                 Type your score                 ",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 96, 85, 197),
                                    width: 25,
                                  ))),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 500,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Grade = Cal(double.parse(inputController.text));
                          
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 25),
                          )),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Color.fromARGB(255, 97, 101, 213)))),
              Text(
                Grade,
                style: Theme.of(context).textTheme.headline2,
              )
            ]),
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Grade Calculator",
          style: TextStyle(fontSize: 25),
        )),
        backgroundColor: Color.fromARGB(255, 96, 85, 197),
      ),
    );
  }
}
