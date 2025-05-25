import 'package:flutter/material.dart';
import 'meal_details_screen.dart';

class ProgramTypeScreen extends StatelessWidget {
  final String goal; // Prise de Masse, Perte de Poids, etc.
  final String programType; // Africain, Européen, etc.

  ProgramTypeScreen({required this.goal, required this.programType});

  @override
  Widget build(BuildContext context) {
    // Vérification des conditions pour afficher les repas spécifiques à la "Prise de Masse - Africain"
    if (goal == "Prise de Masse" && programType == "Africain") {
      // Afficher le programme pour la prise de masse version africaine
      return Scaffold(
        appBar: AppBar(
          title: Text("Prise de Masse - Africain"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Repas pour la Prise de Masse - Version Africaine",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildMealCard(
                context,
                "Porridge de maïs avec lait de coco",
                "Riche en glucides et en énergie.",
                "assets/images/porride d'ignamz.jpeg",
                "Faire bouillir de l'eau, ajouter le maïs et cuire jusqu'à ce qu'il soit tendre. Ajouter du lait de coco pour la crémeuse.",
                {
                  "calories": "300 kcal",
                  "proteins": "5g",
                  "carbs": "60g",
                  "fats": "6g",
                  "fiber": "4g",
                },
              ),
              _buildMealCard(
                context,
                "Poulet Yassa avec riz",
                "Riche en protéines et en glucides complexes.",
                "assets/images/poulet yassa.jpeg",
                "Faire mariner le poulet dans des oignons, du citron et de la moutarde, puis cuire avec du riz.",
                {
                  "calories": "450 kcal",
                  "proteins": "30g",
                  "carbs": "50g",
                  "fats": "15g",
                  "fiber": "5g",
                },
              ),
              _buildMealCard(
                context,
                "Eba avec Egusi et viande",
                "Source d'énergie et de protéines.",
                "assets/images/eba avec egus.jpeg",
                "Faire cuire la pâte d'igname avec de l'huile de palme et servir avec la soupe Egusi et de la viande.",
                {
                  "calories": "500 kcal",
                  "proteins": "25g",
                  "carbs": "60g",
                  "fats": "20g",
                  "fiber": "7g",
                },
              ),
              _buildMealCard(
                context,
                "Fufu avec Sauce Gombo",
                "Apport en fibres et protéines.",
                "assets/images/foufou.jpeg",
                "Préparer le fufu à partir de manioc ou plantain, puis servir avec une sauce gombo riche en protéines.",
                {
                  "calories": "450 kcal",
                  "proteins": "15g",
                  "carbs": "80g",
                  "fats": "12g",
                  "fiber": "5g",
                },
              ),
              _buildMealCard(
                context,
                "Bouilli de Plantain avec poisson grillé",
                "Riche en glucides complexes et protéines.",
                "assets/images/poisson braisé.jpeg",
                "Faire bouillir les plantains et servir avec du poisson grillé, accompagné de légumes.",
                {
                  "calories": "400 kcal",
                  "proteins": "25g",
                  "carbs": "50g",
                  "fats": "10g",
                  "fiber": "4g",
                },
              ),
            ],
          ),
        ),
      );
    } else if (goal == "Prise de Masse" && programType == "Européen") {
      // Affichage des repas pour la prise de masse version européenne
      return Scaffold(
        appBar: AppBar(
          title: Text("Prise de Masse - Européen"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Repas pour la Prise de Masse - Version Européenne",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildMealCard(
                context,
                "Spaghetti Bolognese",
                "Riche en glucides et protéines.",
                "assets/images/bolognese.jpeg",
                "Cuire les spaghetti et préparer une sauce bolognaise avec de la viande hachée et des tomates.",
                {
                  "calories": "600 kcal",
                  "proteins": "30g",
                  "carbs": "80g",
                  "fats": "15g",
                  "fiber": "5g",
                },
              ),
              _buildMealCard(
                context,
                "Salmon with roasted potatoes",
                "Riche en acides gras et en protéines.",
                "assets/images/salmon with roasted potatoes.jpeg",
                "Griller le saumon et accompagner de pommes de terre rôties.",
                {
                  "calories": "550 kcal",
                  "proteins": "40g",
                  "carbs": "35g",
                  "fats": "30g",
                  "fiber": "4g",
                },
              ),
              _buildMealCard(
                context,
                "Chicken breast with quinoa",
                "Apport en protéines et glucides complexes.",
                "assets/images/chicken breast with quinoa.jpeg",
                "Cuire la poitrine de poulet et la servir avec du quinoa.",
                {
                  "calories": "450 kcal",
                  "proteins": "45g",
                  "carbs": "40g",
                  "fats": "8g",
                  "fiber": "6g",
                },
              ),
              _buildMealCard(
                context,
                "Vegetable stir-fry with tofu",
                "Source de fibres et protéines.",
                "assets/images/vegetable stir-fry with tofu.jpeg",
                "Faire sauter des légumes avec du tofu dans une poêle.",
                {
                  "calories": "350 kcal",
                  "proteins": "20g",
                  "carbs": "40g",
                  "fats": "12g",
                  "fiber": "8g",
                },
              ),
              _buildMealCard(
                context,
                "Omelette with avocado",
                "Riche en protéines et graisses saines.",
                "assets/images/Omelette with avocado.jpeg",
                "Faire une omelette avec des œufs et servir avec de l'avocat.",
                {
                  "calories": "400 kcal",
                  "proteins": "25g",
                  "carbs": "10g",
                  "fats": "30g",
                  "fiber": "7g",
                },
              ),
            ],
          ),
        ),
      );
    } else {
      // Pour les autres objectifs ou types de programme, afficher un message indiquant qu'il n'y a pas de repas spécifique
      return Scaffold(
        appBar: AppBar(
          title: Text("$goal - $programType"),
        ),
        body: Center(
          child: Text("Pas de repas spécifique pour cet objectif."),
        ),
      );
    }
  }

  // Fonction pour construire un card de repas avec image et naviguer vers la page de détails
  Widget _buildMealCard(
    BuildContext context, // Ajouter le paramètre context ici
    String meal,
    String description,
    String imagePath,
    String preparationMethod,
    Map<String, String> nutrition,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(meal),
        subtitle: Text(description),
        leading: Container(
          width: 60, // Taille ajustée pour l'image
          height: 60, // Taille ajustée pour l'image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover, // L'image s'adapte à l'espace sans débordement
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Naviguer vers la page de détails du repas
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealDetailsScreen(
                meal: meal,
                description: description,
                preparationMethod: preparationMethod,
                nutrition: nutrition,
              ),
            ),
          );
        },
      ),
    );
  }
}
