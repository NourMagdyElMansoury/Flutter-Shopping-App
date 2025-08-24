import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd, required String addLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Ink.image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: FilledButton.tonalIcon(
                onPressed: onAdd,
                icon: const Icon(Icons.add_shopping_cart_rounded),
                label: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
