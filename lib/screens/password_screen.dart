import 'package:eatwise/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:eatwise/screens/login_screen.dart'; // Assure-toi d'importer LoginScreen
import 'home_screen.dart';

class PasswordScreen extends StatefulWidget {
  final String email;
  PasswordScreen({required this.email});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fond d'écran
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
                  // Affichage de l'email
                  Text(
                    "Bonjour, ${widget.email}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Message pour demander le mot de passe
                  Text(
                    "Entrez votre mot de passe",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Champ de saisie du mot de passe
                  _buildPasswordField(),
                  SizedBox(height: 15),
                  // Bouton de connexion
                  _buildLoginButton(context),
                  SizedBox(height: 20),
                  // Bouton de récupération de mot de passe
                  _buildForgotPasswordButton(context),
                  Spacer(),
                  // Bouton de retour
                  TextButton(
                    onPressed: () {
                      // Navigue vers la page de connexion (LoginScreen)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Retour", style: TextStyle(color: Colors.white)),
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

  // Champ de saisie pour le mot de passe
  Widget _buildPasswordField() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Mot de passe",
          hintStyle: TextStyle(color: Colors.white70),
        ),
        style: TextStyle(color: Colors.white),
        obscureText: true, // Masque le mot de passe
      ),
    );
  }

  // Bouton de connexion
  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_passwordController.text.isNotEmpty) {
          // Navigue vers la page d'accueil
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Veuillez entrer un mot de passe")),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text("Se connecter", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  // Bouton pour récupérer le mot de passe
  Widget _buildForgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
        );
      },
      child: Text(
        "Mot de passe oublié?",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
