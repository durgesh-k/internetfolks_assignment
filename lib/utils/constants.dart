import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// functions to return current size(height/weight) of the screen
double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// Color variables
Color primary = const Color(0xFF5669FF);
Color secondary = const Color(0xFF120D26);

String formatDateTime(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);
  final formattedDate = DateFormat('E, MMM d').format(dateTime);
  final formattedTime = DateFormat('h:mm a').format(dateTime);

  return '$formattedDate • $formattedTime';
}

TextEditingController search = new TextEditingController();
