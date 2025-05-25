import 'package:flutter/material.dart';
import 'package:eatwise/screens/program_type_screen.dart';
import 'package:animate_do/animate_do.dart'; // Assurez-vous d'ajouter la dépendance

class FoodTrackingScreen extends StatelessWidget {
  void navigateToProgramTypeScreen(BuildContext context, String selectedGoal, String selectedProgramType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProgramTypeScreen(
          goal: selectedGoal,
          programType: selectedProgramType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 156, 24),
        title: Text("Suivi Alimentaire", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 500),
              child: Text("Sélectionnez vos objectifs", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            _buildGoalGrid(context),
            SizedBox(height: 30),
            _buildMedicalNeedsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeft(
          duration: Duration(milliseconds: 600),
          child: Text("Objectifs Physiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var goal = index == 0 ? "Prise de Masse" : "Perte de Poids";
            var goalIcon = _getGoalIcon(index);
            return GestureDetector(
              onTap: () {
                _showProgramSelectionDialog(context, goal);
              },
              child: FadeInUp(
                duration: Duration(milliseconds: 700),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(goalIcon, color: Colors.orange, size: 40),
                        SizedBox(height: 10),
                        Text(goal, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  IconData _getGoalIcon(int index) {
    // Icônes associées aux objectifs physiques
    List<IconData> goalIcons = [
      Icons.fitness_center, // Prise de Masse (Haltère)
      Icons.accessibility,  // Perte de Poids (Silhouette svelte)
    ];
    return goalIcons[index];
  }

  void _showProgramSelectionDialog(BuildContext context, String goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sélectionner le type de programme"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Africain"),
                onTap: () {
                  Navigator.pop(context);
                  navigateToProgramTypeScreen(context, goal, "Africain");
                },
              ),
              ListTile(
                title: Text("Européen"),
                onTap: () {
                  Navigator.pop(context);
                  navigateToProgramTypeScreen(context, goal, "Européen");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMedicalNeedsGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInLeft(
          duration: Duration(milliseconds: 800),
          child: Text("Besoins Médicaux", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var medicalNeed = _getMedicalNeed(index);
            var medicalIcon = _getMedicalIcon(index);
            return GestureDetector(
              onTap: () {
                _showMedicalNeedInfo(context, medicalNeed);
              },
              child: FadeInUp(
                duration: Duration(milliseconds: 900),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(medicalIcon, color: Colors.blue, size: 30),
                        SizedBox(height: 10),
                        Text(medicalNeed, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String _getMedicalNeed(int index) {
    List<String> medicalNeeds = [
      "Diabète",
      "Tension",
      "Cholestérol",
      "Santé Osseuse",
      "Anémie",
      "Autres",
    ];
    return medicalNeeds[index];
  }

  IconData _getMedicalIcon(int index) {
    List<IconData> icons = [
      Icons.access_alarm, // Diabète (Icône de réveil, peut être ajusté pour mieux correspondre)
      Icons.favorite, // Tension (Icône cœur pour la tension)
      Icons.local_hospital, // Cholestérol (Icône de l'hôpital)
      Icons.account_balance, // Santé Osseuse (Icône de colonne vertébrale ou de balance)
      Icons.bloodtype, // Anémie (Icône de sang)
      Icons.add_alert, // Autres (Icône d'alerte)
    ];
    return icons[index];
  }

  void _showMedicalNeedInfo(BuildContext context, String medicalNeed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(medicalNeed),
          content: Text("Pas d'informations spécifiques sur le besoin médical : $medicalNeed"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
