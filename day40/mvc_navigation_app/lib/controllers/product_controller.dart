import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../views/detail_view.dart';

class ProductController {

  final List<ProductModel> products = [

    ProductModel(
      name: "iPhone 15",
      price: "₹79,999",
      description: "Apple flagship smartphone with A16 Bionic chip.",
      emoji: "📱",
    ),

    ProductModel(
      name: "MacBook Air",
      price: "₹1,14,999",
      description: "Lightweight laptop powered by Apple M2 chip.",
      emoji: "💻",
    ),

    ProductModel(
      name: "AirPods Pro",
      price: "₹24,999",
      description: "Premium wireless earbuds with ANC support.",
      emoji: "🎧",
    ),

    ProductModel(
      name: "Apple Watch",
      price: "₹42,999",
      description: "Smartwatch with fitness and health tracking.",
      emoji: "⌚",
    ),
  ];

  void openDetails(
    BuildContext context,
    ProductModel product,
  ) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailView(product: product),
      ),
    );
  }
}