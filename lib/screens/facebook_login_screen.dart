import 'package:eatwise/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FacebookLoginScreen extends StatelessWidget {
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
                  _buildTitle(),
                  SizedBox(height: 20),
                  _buildLoginButton(context),
                  SizedBox(height: 20),
                  _buildBackButton(context),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Connexion via Facebook",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Simuler une connexion Facebook
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Connexion réussie avec Facebook")),
        );
        // Après la connexion, rediriger vers HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Couleur de Facebook
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text("Se connecter avec Facebook", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context); // Retour à la page précédente
      },
      child: Text(
        "Retour",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
