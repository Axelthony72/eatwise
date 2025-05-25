import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Nom de l'utilisateur";
  String userEmail = "utilisateur@example.com";
  String userWeight = "68 kg";
  String userHeight = "175 cm";
  String userGoalWeight = "65 kg";

  final List<Map<String, dynamic>> weightHistory = [
    {"date": "2025-03-01", "weight": "70 kg"},
    {"date": "2025-03-08", "weight": "69 kg"},
    {"date": "2025-03-15", "weight": "68 kg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 192, 174),
        title: Text("Mon Profil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInDown(
                duration: Duration(milliseconds: 500),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/default_profile.jpeg"),
                ),
              ),
              SizedBox(height: 15),
              FadeInUp(
                duration: Duration(milliseconds: 600),
                child: Text(
                  userName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),
              _buildStatCard("Taille", userHeight, Icons.height, Colors.blue),
              SizedBox(height: 10),
              _buildStatCard("Poids Actuel", userWeight, Icons.fitness_center, Colors.orange),
              SizedBox(height: 10),
              _buildStatCard("Objectif de Poids", userGoalWeight, Icons.flag, Colors.green),
              SizedBox(height: 20),
              FadeInUp(
                duration: Duration(milliseconds: 700),
                child: Text("Historique de Poids", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
              ),
              SizedBox(height: 10),
              _buildWeightHistory(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showSettingsDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Mettre à jour le profil", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Création du volet latéral (Drawer)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/default_profile.jpeg"),
                ),
                SizedBox(height: 10),
                Text(userName, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(userEmail, style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.green),
            title: Text('Mon Profil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green),
            title: Text('Paramètres'),
            onTap: () {
              Navigator.pop(context);  // Ferme le drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()), // Navigue vers la page des paramètres
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
              // Gérer les notifications
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.green),
            title: Text('Aide'),
            onTap: () {
              Navigator.pop(context);
              // Gérer l'aide
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.green),
            title: Text('Se Déconnecter'),
            onTap: () {
              Navigator.pop(context);
              // Gérer la déconnexion
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return FadeInLeft(
      duration: Duration(milliseconds: 800),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 30),
                SizedBox(width: 10),
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
              ],
            ),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightHistory() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: weightHistory.length,
      itemBuilder: (context, index) {
        var weightRecord = weightHistory[index];
        return FadeInRight(
          duration: Duration(milliseconds: 900),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.timeline, color: Colors.green),
              title: Text("Poids: ${weightRecord["weight"]}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              subtitle: Text("Date: ${weightRecord["date"]}", style: TextStyle(color: Colors.black54)),
            ),
          ),
        );
      },
    );
  }

  // Affichage du formulaire pour modifier les paramètres
  Future<void> _showSettingsDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController(text: userName);
    TextEditingController emailController = TextEditingController(text: userEmail);
    TextEditingController weightController = TextEditingController(text: userWeight);
    TextEditingController heightController = TextEditingController(text: userHeight);
    TextEditingController goalWeightController = TextEditingController(text: userGoalWeight);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Modifier les Paramètres"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(nameController, "Nom", Icons.person),
                _buildTextField(emailController, "Email", Icons.email),
                _buildTextField(weightController, "Poids Actuel", Icons.fitness_center),
                _buildTextField(heightController, "Taille", Icons.height),
                _buildTextField(goalWeightController, "Objectif de Poids", Icons.flag),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  userEmail = emailController.text;
                  userWeight = weightController.text;
                  userHeight = heightController.text;
                  userGoalWeight = goalWeightController.text;
                });
                Navigator.pop(context);
              },
              child: Text("Sauvegarder"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Annuler"),
            ),
          ],
        );
      },
    );
  }

  // Widget pour le champ de texte
  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.green),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

// Nouvelle page de paramètres
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 192, 174),
        title: Text("Paramètres", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Text(
          "Page des paramètres.",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
