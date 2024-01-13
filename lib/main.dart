import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestaurantListPage(),
    );
  }
}

class RestaurantListPage extends StatelessWidget {
  final List<Map<String, String>> restaurants = [
    {'name': 'The Golden Spoon', 'owner': 'Alice Johnson'},
    {'name': 'Ocean Delights', 'owner': 'Samuel Peterson'},
    {'name': 'The Hungry Bear', 'owner': 'Emily Clark'},
    // ... add more restaurants here, up to 20
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          var restaurant = restaurants[index];
          return Card(
            child: ListTile(
              title: Text(
                restaurant['name']!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetailPage(restaurant: restaurant),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RestaurantDetailPage extends StatelessWidget {
  final Map<String, String> restaurant;

  RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant['name']!),
      ),
      body: Center(
        child: Text(
          'Welcome to ${restaurant['name']}! This restaurant is owned by ${restaurant['owner']}.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
