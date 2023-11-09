import 'package:flutter/material.dart';

class Barang {
  final String nama;
  final String harga;
  final String amount;
  final String description;
  const Barang({
    required this.nama,
    required this.harga,
    required this.amount,
    required this.description,
  });
}

class BarangCard extends StatelessWidget {
  final Barang item;

  const BarangCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add elevation for a card-like effect
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama: ${item.nama}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Add spacing between fields
              Text(
                'Harga: ${item.harga}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Amount: ${item.amount}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Description: ${item.description}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
