import 'package:flutter/material.dart';
import 'login.dart';
import 'login_pengasuh.dart'; // Import the new file
import 'input_data_anak.dart';
import 'data_anak.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[350], // Light grey background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/gambar2.png', // Replace with your image path
              height: 250, // Adjust the height as needed
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Kids Daycare!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800], // Dark brown text color
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()), // Login sebagai Parents
                  );
                },
                icon: Icon(Icons.login),
                label: Text('Login sebagai Parents'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400], // Soft pastel orange button background
                  foregroundColor: Colors.brown[800], // Dark brown text color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPengasuhScreen()), // Login sebagai Pengasuh
                  );
                },
                icon: Icon(Icons.login),
                label: Text('Login sebagai Pengasuh'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400], // Soft pastel orange button background
                  foregroundColor: Colors.brown[800], // Dark brown text color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KegiatanAnakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Anak'),
        backgroundColor: Colors.orange[300], // Soft pastel orange app bar
      ),
      body: Center(
        child: Text(
          'Halaman Kegiatan Anak',
          style: TextStyle(
            color: Colors.brown[800], // Dark brown text color
          ),
        ),
      ),
    );
  }
}
