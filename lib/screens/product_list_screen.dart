import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Grid View',
            onPressed: () => setState(() => isGrid = true),
            icon: const Icon(Icons.grid_view),
          ),
          IconButton(
            tooltip: 'List View',
            onPressed: () => setState(() => isGrid = false),
            icon: const Icon(Icons.view_list),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Choose your product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text('${products.length} items'),
              ],
            ),
          ),
          Expanded(
            child: isGrid
                ? GridView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),

                    padding: const EdgeInsets.all(12),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.70,
                        ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        isGrid: true,
                        onTop: () => openDetails(context, product),
                      );
                    },
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.all(12),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return SizedBox(
                        height: 145,
                        child: ProductCard(
                          product: product,
                          isGrid: false,
                          onTop: () => openDetails(context, product),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void openDetails(BuildContext context, product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
    );
  }
}
