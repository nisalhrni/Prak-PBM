import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_page.dart'; // Import halaman registrasi

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Page',
                style: GoogleFonts.poppins(
                  fontSize: size * 0.080,
                ),
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              InputWidget(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Handle login logic
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: size * 0.040,
                  ),
                ),
              ),
              const SizedBox(height: 10), // Spasi tambahan
              TextButton(
                onPressed: () {
                  // Pindah ke halaman registrasi
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: size * 0.040,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const InputWidget({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
