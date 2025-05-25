import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'food_details_screen.dart';
import 'food_tracking_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> allFoodItems = [
  {
      "title": "Pomme",
      "description": "Un fruit sucré et croquant riche en vitamines.",
      "image": "assets/images/pomme.jpeg",
      "calories": 52,
      "proteines": "0.3 g",
      "glucides": "13.8 g",
      "lipides": "0.2 g",
      "fibres": "2.4 g",
      "vitamineC": "4.6 mg",
      "potassium": "107 mg",
    },
    {
      "title": "Banane",
      "description": "Un fruit riche en potassium, parfait pour l'énergie.",
      "image": "assets/images/banane.jpeg",
      "calories": 89,
      "proteines": "1.1 g",
      "glucides": "22.8 g",
      "lipides": "0.3 g",
      "fibres": "2.6 g",
      "vitamineC": "8.7 mg",
      "potassium": "358 mg",
    },
    {
      "title": "Orange",
      "description": "Une excellente source de vitamine C.",
      "image": "assets/images/orange.jpeg",
      "calories": 43,
      "proteines": "0.9 g",
      "glucides": "10.4 g",
      "lipides": "0.1 g",
      "fibres": "2.4 g",
      "vitamineC": "53.2 mg",
      "potassium": "181 mg",
    },
    {
      "title": "Carotte",
      "description": "Riche en bêta-carotène et bonne pour la vision.",
      "image": "assets/images/carotte.jpeg",
      "calories": 41,
      "proteines": "0.9 g",
      "glucides": "9.6 g",
      "lipides": "0.2 g",
      "fibres": "2.8 g",
      "vitamineA": "835 µg",
      "potassium": "320 mg",
    },
    {
      "title": "Brocoli",
      "description": "Un légume riche en fibres et en vitamine C.",
      "image": "assets/images/brocoli.jpeg",
      "calories": 34,
      "proteines": "2.8 g",
      "glucides": "6.6 g",
      "lipides": "0.4 g",
      "fibres": "2.6 g",
      "vitamineC": "89.2 mg",
      "potassium": "316 mg",
    },
    {
      "title": "Épinard",
      "description": "Un super aliment riche en fer et en vitamines.",
      "image": "assets/images/epinard.jpeg",
      "calories": 23,
      "proteines": "2.9 g",
      "glucides": "3.6 g",
      "lipides": "0.4 g",
      "fibres": "2.2 g",
      "vitamineA": "469 µg",
      "potassium": "558 mg",
    },
    {
      "title": "Lait",
      "description": "Riche en calcium et bon pour les os.",
      "image": "assets/images/lait.jpeg",
      "calories": 42,
      "proteines": "3.4 g",
      "glucides": "5 g",
      "lipides": "1 g",
      "calcium": "125 mg",
      "vitamineD": "1.1 µg",
      "potassium": "150 mg",
    },
    {
      "title": "Poitrine de poulet",
      "description": "Une excellente source de protéines maigres.",
      "image": "assets/images/poulet.jpeg",
      "calories": 165,
      "proteines": "31 g",
      "glucides": "0 g",
      "lipides": "3.6 g",
      "fer": "0.7 mg",
      "potassium": "256 mg",
    },
    {
      "title": "Saumon",
      "description": "Riche en oméga-3 et en protéines.",
      "image": "assets/images/saumon.jpeg",
      "calories": 206,
      "proteines": "22 g",
      "glucides": "0 g",
      "lipides": "13 g",
      "omega3": "2260 mg",
      "potassium": "363 mg",
    },
    {
      "title": "Œufs",
      "description": "Un aliment complet riche en protéines et en nutriments.",
      "image": "assets/images/oeuf.jpeg",
      "calories": 155,
      "proteines": "13 g",
      "glucides": "1.1 g",
      "lipides": "10.6 g",
      "calcium": "56 mg",
      "fer": "1.2 mg",
      "potassium": "126 mg",
    },
  ];

  List<Map<String, dynamic>> filteredFoodItems = [];

  @override
  void initState() {
    super.initState();
    filteredFoodItems = allFoodItems;
    _searchController.addListener(_filterFoods);
  }

  void _filterFoods() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredFoodItems = allFoodItems
          .where((item) => item["title"].toLowerCase().contains(query))
          .toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            _getScreenContent(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Suivi Alimentaire',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getScreenContent() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return FoodTrackingScreen();
      case 2:
        return ProfileScreen();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FadeInDown(
            duration: Duration(milliseconds: 500),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Rechercher un aliment...",
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: filteredFoodItems.length,
            itemBuilder: (context, index) {
              var food = filteredFoodItems[index];
              return FadeInUp(
                duration: Duration(milliseconds: 600 + (index * 100)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsScreen(foodItem: food),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            food["image"],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          food["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}