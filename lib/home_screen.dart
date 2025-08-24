import 'package:flutter/material.dart';
import 'package:shoppingcart/product_card.dart';
import '../product_card.dart';
import '../offer_item.dart';
import 'offer_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredImages =
    List.generate(5, (i) => "https://picsum.photos/seed/feat$i/600/300");

    final products = List.generate(
      8,
          (i) => ("https://picsum.photos/seed/prod$i/400/400", "Product ${i + 1}"),
    );

    final offers = List.generate(
      5,
          (i) => (
      "https://picsum.photos/seed/offer$i/500/300",
      "Special offer ${i + 1}: save big on your next purchase!"
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Our Products"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text("Featured",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: featuredImages.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(featuredImages[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: .78,
                ),
                itemBuilder: (context, index) {
                  final (img, title) = products[index];
                  return ProductCard(
                    imageUrl: img,
                    title: title,
                    onAdd: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to the cart")),
                      );
                    }, addLabel: 'ProductCard',
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text("Hot Offers",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              itemCount: offers.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final (img, desc) = offers[index];
                return OfferItem(imageUrl: img, description: desc);
              },
            ),
          ],
        ),
      ),
    );
  }
}
