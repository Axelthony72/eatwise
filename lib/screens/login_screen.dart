import 'package:eatwise/screens/apple_login_screen.dart';
import 'package:eatwise/screens/facebook_login_screen.dart';
import 'package:eatwise/screens/google_login_screen.dart';
import 'package:eatwise/screens/password_screen.dart'; // Import de PasswordScreen
import 'package:eatwise/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
                  _buildInputField(),
                  SizedBox(height: 15),
                  _buildLoginButton(context),
                  SizedBox(height: 20),
                  Text("Ou", style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 20),
                  _socialButton(
                    context,
                    "Continuer avec Facebook",
                    "assets/icons/facebook.jpeg",
                    FacebookLoginScreen(),
                  ),
                  SizedBox(height: 10),
                  _socialButton(
                    context,
                    "Continuer avec Google",
                    "assets/icons/google.jpeg",
                    GoogleLoginScreen(),
                  ),
                  SizedBox(height: 10),
                  _socialButton(
                    context,
                    "Continuer avec Apple",
                    "assets/icons/apple.jpeg",
                    AppleLoginScreen(),
                  ),
                  Spacer(),
                  _buildSignUpButton(context),
                  SizedBox(height: 20),
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
      "BIENVENUE!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.white70),
        ),
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_emailController.text.isNotEmpty) {
          // Redirection vers PasswordScreen avec l'email saisi
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordScreen(email: _emailController.text),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Veuillez entrer un email")),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text("Continuer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _socialButton(BuildContext context, String text, String iconPath, Widget screen) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ajustement spécifique pour Google (réduit à 20x20)
          Container(
            width: iconPath == "assets/icons/google.jpeg" ? 20 : 30,  // Google réduit à 20, autres icônes à 30
            height: iconPath == "assets/icons/google.jpeg" ? 20 : 30, // Google réduit à 20, autres icônes à 30
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconPath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}



  Widget _buildSignUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
      child: Text(
        "Vous n'avez pas de compte? Inscrivez-vous",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
