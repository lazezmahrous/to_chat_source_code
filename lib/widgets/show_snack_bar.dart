import 'package:flutter/material.dart';
import 'package:to_chat/constanc.dart';

void showSnackBar(
    {required BuildContext context,
    required String message,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    content: Text(
      message,
      style: TextStyle(color: Constans.kColorWhite),
    ),
  ));
}
