import 'package:flutter/material.dart';

Widget chatMessageWidget(String message, bool isUserMessage) {
  return Align(
    alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isUserMessage ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}
