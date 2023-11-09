import 'package:flutter/material.dart';
import 'package:inventory/models/barang.dart';
import 'package:inventory/storage/storage.dart';
import 'package:inventory/widgets/left_drawer.dart';

class BarangList extends StatelessWidget {
  BarangList({Key? key}) : super(key: key);

  final List<Barang> items = [
    const Barang(nama: 'Item 1', harga: '10.00', amount: '5', description: 'Description for Item 1'),
    const Barang(nama: 'Item 2', harga: '15.00', amount: '3', description: 'Description for Item 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory',
          style: TextStyle(
            color: Colors.white,
          ),
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: ItemsStorage.barangs.length,
                itemBuilder: (context, index) {
                  return BarangCard(ItemsStorage.barangs[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
