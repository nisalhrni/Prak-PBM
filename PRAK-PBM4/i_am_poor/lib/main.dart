import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text( 'I am poor',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[700],
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: Image(
            image: AssetImage('images/poor.jpg'),
          ),
        ),
      ),
    ),
  );
}