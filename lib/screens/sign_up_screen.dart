import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();  // Correction ici

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/imagelogin.jpeg",
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    "Inscription",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField("Prénom", _firstNameController),
                  SizedBox(height: 15),
                  _buildTextField("Nom", _lastNameController),
                  SizedBox(height: 15),
                  _buildTextField("Email", _emailController),
                  SizedBox(height: 15),
                  _buildTextField("Mot de passe", _passwordController, obscureText: true),
                  SizedBox(height: 15),
                  _buildTextField("Confirmer le mot de passe", _confirmPasswordController, obscureText: true),  // Confirmation du mot de passe
                  SizedBox(height: 20),
                  _buildSignUpButton(context),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Retour à la page de connexion
                    },
                    child: Text("Vous avez déjà un compte? Connectez-vous", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyle(color: Colors.white70),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_passwordController.text == _confirmPasswordController.text) {
          // Simuler l'inscription et rediriger vers la HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Les mots de passe ne correspondent pas")),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text("S'inscrire", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
