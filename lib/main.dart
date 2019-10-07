import 'package:flutter/material.dart';
import './ui/home.dart';

void main()
{
  var title = "Bmi Calculator";

  runApp(new MaterialApp(
    color: Colors.lightBlueAccent,
    title: title,
    home: Bmi()
  ));
}


