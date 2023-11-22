import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory/models/barang.dart';
import 'package:inventory/widgets/left_drawer.dart';

class BarangPage extends StatefulWidget {
    const BarangPage({super.key});

    @override
    // ignore: library_private_types_in_public_api
    _BarangPageState createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
Future<List<Barang>> fetchBarang() async {
    var url = Uri.parse(
        // ganti ke 'https://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/json-usr/'
        // untuk filter berdasarkan user, tetapi karena di versi deploy tidak bisa
        // login jadi filter user-nya tidak bekerja padahal kalau di local bisa jalan.
        'https://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/json-usr/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Barang> listBarang = [];
    for (var d in data) {
        if (d != null) {
            listBarang.add(Barang.fromJson(d));
        }
    }
    return listBarang;
}

void _navigateToDetailPage(Barang barang) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailPage(barang: barang,)
    ),
  );
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Daftar Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchBarang(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell (
                          onTap: () => _navigateToDetailPage(snapshot.data![index]),
                          child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.grey, spreadRadius: 3),
                                  ],
                                ),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("Jumlah: ${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text("Deskripsi: ${snapshot.data![index].fields.description}"),
                                ],
                                ),
                            ) ,
                        )
                      );
                    }
                }
            }));
    }
}

class DetailPage extends StatelessWidget {
  final Barang barang;

  const DetailPage({super.key, required this.barang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Item'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              barang.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Harga: ${barang.fields.price}"),
            const SizedBox(height: 10),
            Text("Jumlah: ${barang.fields.amount}"),
            const SizedBox(height: 10),
            Text("Deskripsi: ${barang.fields.description}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}