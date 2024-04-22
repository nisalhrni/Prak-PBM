import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const TanyaDakuApp());
}

class TanyaDakuApp extends StatelessWidget {
  const TanyaDakuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HalamanBola(),
    );
  }
}

class HalamanBola extends StatelessWidget {
  const HalamanBola({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Tanya Daku Apa Saja",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Bola(),
      backgroundColor: Colors.blue,
    );
  }
}

class Bola extends StatefulWidget {
  const Bola({Key? key}) : super(key: key);

  @override
  State<Bola> createState() => _BolaState();
}

class _BolaState extends State<Bola> {
  int nomorBola = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            // Menggunakan dart:math untuk menghasilkan angka acak antara 1 dan 5
            nomorBola = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset(
          'images/ball$nomorBola.png', // Menggunakan nomorBola untuk menampilkan gambar secara dinamis
        ),
      ),
    );
  }
}
