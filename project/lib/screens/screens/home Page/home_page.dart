import 'package:sierra/screens/ProductDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sierra/widgets/theme_notifier.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  List<bool> isFavoriteList;

  final List<Map<String, String>> products = [
    {
      'name': 'ADIDAS BASKETBALL LONG SLEEVE',
      'image': 'assets/images/product1.png',
      'price': 'Rs 3000.00',
    },
    {
      'name': 'NIKE RUNNING SHIRT',
      'image': 'assets/images/product2.png',
      'price': 'Rs 5000.00',
    },
    {
      'name': 'PUMA HOODIE',
      'image': 'assets/images/product3.png',
      'price': 'Rs 2000.00',
    },
    {
      'name': 'REEBOK TRAINING SHIRT',
      'image': 'assets/images/product4.png',
      'price': 'Rs 4000.00',
    },
  ];

  _HomePageState() : isFavoriteList = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);

    
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'SIERRA',
          style: TextStyle(
            fontFamily: 'Poly',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),

                      // Banner section
                      Container(
                        width: double.infinity,
                        height: isLandscape ? 200 : 200, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/banner.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 80,
                              left: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'New Trend',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Collection',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 130,
                              left: 16,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(178, 151, 79, 1),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  // Add shop new functionality
                                },
                                child: const Text(
                                  'SHOP NEW',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildCategoryButton('All'),
                            const SizedBox(width: 16),
                            _buildCategoryButton('Men'),
                            const SizedBox(width: 16),
                            _buildCategoryButton('Women'),
                            const SizedBox(width: 16),
                            _buildCategoryButton('Kids'),
                            const SizedBox(width: 16),
                            _buildCategoryButton('Accessories'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Product Grid
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLandscape ? 3 : 2, 
                          childAspectRatio: isLandscape ? 2 / 2 : 2 / 3, 
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 30,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return _buildProductCard(
                            context,
                            product['name']!,
                            product['image']!,
                            product['price']!,
                            index, 
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: themeNotifier.isDarkMode ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 6,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poly',
                        fontStyle: FontStyle.italic,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search Here',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Category button builder
  Widget _buildCategoryButton(String text) {
    bool isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromRGBO(178, 151, 79, 1) : (Provider.of<ThemeNotifier>(context).isDarkMode ? Colors.grey[800] : Colors.white),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(178, 151, 79, 1),
            width: 2.0,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : (Provider.of<ThemeNotifier>(context).isDarkMode ? Colors.white : Colors.black),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Product card builder with navigation to ProductDetailsPage and favorite button
  Widget _buildProductCard(BuildContext context, String productName, String productImage, String price, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Provider.of<ThemeNotifier>(context).isDarkMode ? Colors.grey[850] : Colors.white, // Set card color based on theme
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(productImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavoriteList[index] = !isFavoriteList[index]; 
                      });
                    },
                    child: Icon(
                      isFavoriteList[index] ? Icons.favorite : Icons.favorite_border,
                      color: isFavoriteList[index] ? Colors.red : Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(198, 38, 38, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
