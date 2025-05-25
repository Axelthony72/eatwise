import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FoodDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> foodItem;

  FoodDetailsScreen({required this.foodItem});

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.foodItem["title"]} - Détails"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Effet dynamique sur l'image
            GestureDetector(
              onTap: () {
                setState(() {
                  // Animation d'agrandissement ou réduction de l'image
                  if (_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward(from: 0.0);
                  }
                });
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          widget.foodItem["image"],
                          height: 300, // Taille de l'image
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            SizedBox(height: 16),

            // Affichage du nom et de la description de l'aliment
            Text(
              widget.foodItem["title"],
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.foodItem["description"],
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),

            // Cartes pour chaque nutriment avec bordure colorée
            _buildNutrientCard("Calories", "${widget.foodItem["calories"]} kcal", Colors.orange, Icons.local_fire_department),
            _buildNutrientCard("Protéines", "${widget.foodItem["proteines"] ?? 'Non spécifié'} g", Colors.green, Icons.fitness_center),
            _buildNutrientCard("Glucides", "${widget.foodItem["glucides"] ?? 'Non spécifié'} g", Colors.blue, Icons.fastfood),
            _buildNutrientCard("Lipides", "${widget.foodItem["lipides"] ?? 'Non spécifié'} g", Colors.yellow, Icons.local_dining),
            _buildNutrientCard("Fibres", "${widget.foodItem["fibres"] ?? 'Non spécifié'} g", Colors.brown, Icons.grain),
            _buildNutrientCard("Vitamine C", "${widget.foodItem["vitamineC"] ?? 'Non spécifié'} mg", Colors.red, Icons.vaccines),
            _buildNutrientCard("Potassium", "${widget.foodItem["potassium"] ?? 'Non spécifié'} mg", Colors.purple, Icons.water_drop),

            // Conseils de consommation
            SizedBox(height: 20),
            Text(
              "Conseil de consommation :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Consommez cet aliment frais ou dans vos smoothies pour une énergie durable !",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour afficher une carte d'un nutriment avec une bordure colorée
  Widget _buildNutrientCard(String title, String value, Color color, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Afficher un toast ou un dialogue avec plus d'infos sur le nutriment
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Détails sur $title"),
            content: Text("Le $title est essentiel pour...")
          ),
        );
      },
      child: FadeInUp(
        duration: Duration(milliseconds: 500),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: color.withOpacity(0.1), // Couleur de fond translucide
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
