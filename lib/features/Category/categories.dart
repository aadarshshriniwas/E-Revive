import 'package:flutter/material.dart';

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
      title: 'Industrial Waste',
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
          return InkWell(
            onTap: () {
              // Handle category item tap, e.g., navigate to a category-specific page
              _handleCategoryTap(category);
            },
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
    // Handle category item tap here, e.g., navigate to a category-specific page
    // For demonstration, we'll show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Category: ${category.title}'),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final String imageAsset;

  CategoryItem({required this.title, required this.imageAsset});
}
