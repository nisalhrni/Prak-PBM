import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'data_anak.dart'; // Pastikan untuk mengimpor halaman ActivityInputScreen

class LoginPengasuhScreen extends StatefulWidget {
  @override
  _LoginPengasuhScreenState createState() => _LoginPengasuhScreenState();
}

class _LoginPengasuhScreenState extends State<LoginPengasuhScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DataAnakScreen()),
    );
  }

  void _loginWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In successful')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DataAnakScreen()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Pengasuh',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 60), // Memberi ruang antara AppBar dan konten
              Image.asset(
                'images/gambar2.png',
                height: 150, // Adjust the height as needed
              ),
              SizedBox(height: 20),
              Text(
                'Login to continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Tambahkan logika untuk mengarahkan pengguna ke halaman lupa password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              _isLoading
                  ? CircularProgressIndicator()
                  : Column(
                children: [
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: _loginWithGoogle,
                    child: Text(
                      'Login with Google',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
