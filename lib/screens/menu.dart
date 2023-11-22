import 'package:flutter/material.dart';
import 'package:inventory/widgets/left_drawer.dart';
import 'package:inventory/widgets/inventory_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<InventoryItem> items = [
    InventoryItem("Lihat Item", Icons.checklist, Colors.amber),
    InventoryItem("Tambah Item", Icons.add_shopping_cart, Colors.blue),
    InventoryItem("Logout", Icons.logout, Colors.cyan),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory',
           style: TextStyle(
            color: Colors.white,
          )
        ),
        elevation: 20,
        backgroundColor: Colors.grey,
        shadowColor: Colors.black,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "Iqza's Inventory",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  return InventoryCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}