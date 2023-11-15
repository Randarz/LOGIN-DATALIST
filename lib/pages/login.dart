import 'package:flutter/material.dart';
import 'package:list_dataa/components/my_textfield.dart';
import 'package:list_dataa/components/listdata.dart';

// sign user in method
  class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void signUserIn() {
    setState(() {
      isLoading = true;
    });

  Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ListData()));

   ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login succeeded!"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 97, 181, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sloppy!',
                style: TextStyle(
                  color: Color.fromARGB(244, 36, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'We always have all you need!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),

          
              const Icon(
                Icons.shopify,
                size: 160,
                color: Color.fromARGB(244, 10, 23, 169),
              ),

              const SizedBox(height: 25),

              Text(
                'Please sign in to start shopping!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 50),

              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: isLoading ? null : signUserIn,
                style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(244, 10, 23, 169), // Mengubah warna latar belakang menjadi hitam
              ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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