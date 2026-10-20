import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      appBar: AppBar(
        title: const Text(
          'My Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Icon(
              Icons.shopping_bag_outlined,
              size: 100,
              color: Colors.deepOrange,
            ),
            const SizedBox(height: 25),
            const Text(
              'Find Your Style',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Discover our collection of stylish and comfortable shoes.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProductListScreen()),
                  );
                },
                child: const Text(
                  'Expore Products',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
