import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/theme_notifier.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Product Cart',
          style: TextStyle(
            fontFamily: 'Poly',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
        child: Column(
          children: [

            // Cart Items
            Expanded(
              child: ListView(
                children: [
                  CartItem(
                    imageUrl: 'assets/images/product1.png',
                    title: 'ADIDAS BASKETBALL LONG SLEEVE',
                    subtitle: 'Men',
                    price: 2500.0,
                  ),
                  CartItem(
                    imageUrl: 'assets/images/product3.png',
                    title: 'NIKE RUNNING SHIRT',
                    subtitle: 'Men',
                    price: 2500.0,
                  ),
                ],
              ),
            ),
            

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: themeNotifier.isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Discount Code',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: themeNotifier.isDarkMode ? Colors.white54 : Colors.black54), 
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    ),
                  ),
                ],
              ),
            ),
            

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SubTotal', style: TextStyle(fontSize: 16)),
                      Text('Rs 5000.0', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Rs 5000.0', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 30), 
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Check Out', style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w900)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;

  CartItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {

    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        color: themeNotifier.isDarkMode ? Colors.grey[850] : Colors.white, 
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              // Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
                    Text(subtitle, style: TextStyle(color: Colors.grey)),
                    Text('Rs. ${price.toString()}', style: TextStyle(fontSize: 16, color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
                  ],
                ),
              ),

              Column(
                children: [
                  // Quantity Selector
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, size: 18, color: themeNotifier.isDarkMode ? Colors.white : Colors.black),
                          onPressed: () {},
                        ),
                        Text('1', style: TextStyle(color: themeNotifier.isDarkMode ? Colors.white : Colors.black)),
                        IconButton(
                          icon: Icon(Icons.add, size: 18, color: themeNotifier.isDarkMode ? Colors.white : Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  // Delete Button
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}