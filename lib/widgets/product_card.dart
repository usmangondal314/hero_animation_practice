import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isGrid;
  final VoidCallback onTop;
  const ProductCard({
    super.key,
    required this.product,
    required this.isGrid,
    required this.onTop,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: InkWell(
        onTap: onTop,
        child: isGrid
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: productImage()),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: productInfo(),
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(width: 120, height: 130, child: productImage()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: productInfo(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
      ),
    );
  }

  Widget productImage() {
    return Hero(
      tag: product.id,
      child: Material(
        color: Colors.grey.shade100,
        child: Image.asset(
          product.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.image_not_supported, size: 40),
            );
          },
        ),
      ),
    );
  }

  Widget? productInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text('${product.rating}'),
          ],
        ),
      ],
    );
  }
}
