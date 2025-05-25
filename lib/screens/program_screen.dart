import 'package:flutter/material.dart';

class ProgramScreen extends StatelessWidget {
  final String goal;
  final String programType;

  ProgramScreen({required this.goal, required this.programType});

  @override
  Widget build(BuildContext context) {
    // Programme personnalisé en fonction de l'objectif et du type de programme
    String programDetails = ''; 
    if (goal == "Prise de Masse") {
      programDetails = programType == "Européen"
          ? "Programme pour la prise de masse (Européen) :\n\n- Augmenter les protéines.\n- Consommer plus de calories.\n- Favoriser les glucides complexes.\n"
          : "Programme pour la prise de masse (Africain) :\n\n- Augmenter les protéines.\n- Consommer des aliments locaux riches en calories.\n- Prioriser les glucides complexes comme le riz et le manioc.\n";
    } else if (goal == "Perte de Poids") {
      programDetails = programType == "Européen"
          ? "Programme pour la perte de poids (Européen) :\n\n- Réduire les calories.\n- Augmenter l'activité physique.\n- Consommer des aliments faibles en graisses.\n"
          : "Programme pour la perte de poids (Africain) :\n\n- Consommer des légumes à faible teneur en glucides.\n- Augmenter la consommation de protéines maigres comme le poisson.\n";
    } else if (goal == "Anémie") {
      programDetails = programType == "Européen"
          ? "Programme pour l'anémie (Européen) :\n\n- Consommer des aliments riches en fer.\n- Ajouter des aliments riches en vitamine C.\n"
          : "Programme pour l'anémie (Africain) :\n\n- Consommer des légumes à feuilles vertes et du poisson sec.\n- Ajouter des sources locales de vitamine C comme les agrumes.\n";
    } else if (goal == "Fragilité Osseuse") {
      programDetails = programType == "Européen"
          ? "Programme pour la fragilité osseuse (Européen) :\n\n- Consommer des aliments riches en calcium.\n- Ajouter de la vitamine D pour favoriser l'absorption du calcium.\n"
          : "Programme pour la fragilité osseuse (Africain) :\n\n- Consommer du lait de chèvre et des légumes à feuilles.\n- Ajouter des sources locales de calcium comme les graines de sésame.\n";
    } else if (goal == "Tension") {
      programDetails = programType == "Européen"
          ? "Programme pour la tension (Européen) :\n\n- Consommer moins de sel.\n- Augmenter les aliments riches en potassium.\n"
          : "Programme pour la tension (Africain) :\n\n- Consommer des légumes comme l'okra et les aubergines.\n- Augmenter la consommation de poissons gras.\n";
    } else if (goal == "Diabète") {
      programDetails = programType == "Européen"
          ? "Programme pour le diabète (Européen) :\n\n- Consommer des aliments à faible indice glycémique.\n- Réduire les sucres raffinés.\n"
          : "Programme pour le diabète (Africain) :\n\n- Consommer des légumes amers et des légumineuses.\n- Prioriser les céréales complètes comme le mil.\n";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$goal - Programme Alimentaire ($programType)"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Votre programme alimentaire adapté pour $goal ($programType) :",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              programDetails,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
