import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = ProductController();

    return Scaffold(

      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: controller.products.length,

        itemBuilder: (context, index) {

          final product = controller.products[index];

          return Card(

            elevation: 5,

            margin: const EdgeInsets.only(bottom: 18),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            child: ListTile(

              contentPadding: const EdgeInsets.all(18),

              leading: CircleAvatar(
                radius: 30,
                child: Text(
                  product.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ),

              title: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  product.price,
                  style: const TextStyle(fontSize: 18),
                ),
              ),

              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {

                controller.openDetails(
                  context,
                  product,
                );

              },
            ),
          );
        },
      ),
    );
  }
}