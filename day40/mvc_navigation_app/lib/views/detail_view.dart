import 'package:flutter/material.dart';
import '../models/product_model.dart';

class DetailView extends StatelessWidget {

  final ProductModel product;

  const DetailView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Text(
                product.emoji,
                style: const TextStyle(fontSize: 100),
              ),

              const SizedBox(height: 25),

              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                product.price,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 25),

              Text(
                product.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(

                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(Icons.arrow_back),

                label: const Text("Back"),

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}