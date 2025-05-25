import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  final String meal;
  final String description;
  final String preparationMethod;
  final Map<String, String> nutrition;

  // Constructeur pour recevoir les informations du repas
  MealDetailsScreen({
    required this.meal,
    required this.description,
    required this.preparationMethod,
    required this.nutrition,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image du repas
              Image.asset(
                'assets/images/${meal.toLowerCase().replaceAll(' ', '_')}.jpeg', // Assure-toi que l'image est nommée correctement
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                "Description:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(description),
              SizedBox(height: 20),
              Text(
                "Méthode de préparation:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(preparationMethod),
              SizedBox(height: 20),
              Text(
                "Apports nutritionnels:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nutrition.entries.map((entry) {
                  return Text("${entry.key}: ${entry.value}");
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
