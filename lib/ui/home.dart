import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController heighController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String result_reading = "" ,finalResult = "";

  void calculateBmi() {
    setState(() {
      int age = int.parse(ageController.text);
      double height = double.parse(heighController.text);
      inches = height * 12;
      double weight = double.parse(weightController.text);

      if ((ageController.text.isNotEmpty || age > 0) &&
          ((heighController.text.isNotEmpty || inches > 0) &&
              (weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703;

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          result_reading = "UnderWeight";
          debugPrint("$result_reading ");
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          result_reading = "Great Shape wooooow!";
          debugPrint("$result_reading ");
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          result_reading = "OverWeight!";
          debugPrint("$result_reading ");
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          result_reading = "Obese!";
          debugPrint("$result_reading ");
        }
      }
      else {
        debugPrint("$result else");
        result = 0.0;
      }
    });

    finalResult = "Your BMI : ${result.toStringAsFixed(1)}";

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade700,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmi.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 250.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g 24',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: heighController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Heigh',
                        hintText: 'e.g 6.5',
                        icon: new Icon(Icons.insert_chart)),
                  ),

                  new TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Weight',
                          hintText: 'e.g 180',
                          icon: new Icon(Icons.line_weight))),

                  new Padding(padding: new EdgeInsets.all(10.6)),

                  // calculate button
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: calculateBmi,
                      color: Colors.pinkAccent,
                      child: new Text('Calculate'),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "BMI : $finalResult",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$result_reading",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
