import 'package:coffee_shop_ui_08/util/coffee_tile.dart';
import 'package:coffee_shop_ui_08/util/coffee_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
    // [ coffee type, isSelected ]
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tae',
      false,
    ],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selected false
      for (var i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you ------------------------------------//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 25.0),

          // Search Bar ------------------------------------//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: 'Find your coffee..',
                    prefixIcon: Icon(Icons.search, color: Colors.orange)),
              ),
            ),
          ),

          SizedBox(height: 25.0),

          // Horizontal listview of coffee tiles ------------------------------------//
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: (){
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          // Horizontal listview of coffee tiles ------------------------------------//
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'assets/images/cof-2.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '5.30',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/cof-1.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/cof-5.jpg',
                  coffeeName: 'Black',
                  coffeePrice: '4.50',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/cof-6.jpg',
                  coffeeName: 'tae',
                  coffeePrice: '3.30',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/cof-4.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '5.30',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
