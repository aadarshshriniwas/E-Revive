import 'package:flutter/material.dart';
import 'package:e_revive_app/features/Category/small.dart';
import 'package:e_revive_app/features/Category/mobiles.dart';
import 'package:e_revive_app/features/Category/industry.dart';
class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<CategoryItem> categories = [
    CategoryItem(
      title: 'Small Electronics',
      imageAsset: 'assets/assortment-dirty-dumped-objects.jpg', // Replace with your image assets
    ),
    CategoryItem(
      title: 'Mobiles and Gadgets',
      imageAsset: 'assets/assortment-dirty-dumped-objects (1).jpg', // Replace with your image assets
    ),
    CategoryItem(
      title: 'Large Appliances',
      imageAsset: 'assets/distant-shot-port-with-boats-loaded-with-cargo-shipment-during-nighttime.jpg', // Replace with your image assets
    ),
    // Add more CategoryItem instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => _handleCategoryTap(category), // Call the handler with the selected category
            child: Container(
              height: 200, // Adjust the container height as needed
              margin: EdgeInsets.all(10), // Add margin for spacing
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(category.imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleCategoryTap(CategoryItem category) {
    // Perform different actions based on the selected category
    switch (category.title) {
      case 'Small Electronics':
      // Action for Small Electronics category
        print('Tapped Small Electronics');
        // Navigate to a specific page, e.g., Small()
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Small()),
        );
        break;
      case 'Mobiles and Gadgets':
      // Action for Mobiles and Gadgets category
        print('Tapped Mobiles and Gadgets');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>Mobile()),
        );
        // Add your action here
        break;
      case 'Large Appliances':
      // Action for Industrial Waste category
        print('Tapped Industrial Waste');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Industry()),
        );
        // Add your action here
        break;
    // Add more cases for other categories as needed
    }
  }
}

class CategoryItem {
  final String title;
  final String imageAsset;

  CategoryItem({required this.title, required this.imageAsset});
}
