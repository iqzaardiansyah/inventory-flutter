# inventory-flutter

<details>
    <summary>Tugas 7</summary>
    
 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
    -  *Stateless widget* adalah *widget* yang tidak berubah/*immutable*. *Stateless widget* tidak bisa berganti *state* selama *runtime*. Contoh: *Icon*, *IconButton*, dan *Text*.

    -  *Stateful widget* adalah *widget* yang bisa berganti *state* selama *runtime*, yang artinya *stateful widget* bersifat *mutable*. *Stateful widget* biasanya digunakan untuk bagian aplikasi yang akan berubah ketika ada interaksi pengguna atau saat menerima data.


 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    - *Container*: *widget* ini menyediakan 'kanvas' untuk programmer membuat sebuah aplikasi Flutter.
    - *Column*: *widget* ini menampilkan *child* dalam format vertikal.
    - *Text*: *widget* ini menampilkan *string* dalam satu baris.
    - *AppBar*: *widget* ini sama seperti *toolbar* pada aplikasi lain yang sering kita gunakan, yang berguna untuk menampilkan judul dan fitur-fitur utama pada aplikasi.

 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
    - Buka cmd dan jalankan *command* *`flutter create inventory`* untuk membuat projek baru.
    - Jalankan *command* *`cd inventory`*.
    - Buat file baru bernama `menu.dart` dalam direktori lib dan tambahkan kode berikut di baris pertama.
        <pre>
            import 'package:flutter/material.dart';
        </pre>
    - Tambahkan kode berikut di baris kedua pada file `main.dart` agar `main.dart` bisa menggunakan kode yang ada di dalam `menu.dart`
        <pre>
            import 'package:inventory/menu.dart';
        </pre>
    - Pada file `main.dart` Hapus kelas `_MyHomePageState` dan pindahkan kelas `MyHomePageState` ke file `menu.dart`.
    - Ubah baris kode `home: const MyHomePage(title: 'Flutter Demo Home Page'),` pada file `main.dart` menjadi `home: const MyHomePage(),`.
    - Ubah baris kode `colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),` pada file `main.dart` menjadi `colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),`.
    - Pada file `menu.dart`, ubah sifat kelas `MyHomePage` dari *`stateful`* menjadi *`stateless`* dan ubah baris kode `MyHomePage({Key? key}) : super(key: key);` menjadi `MyHomePage({Key? key}) : super(key: key);`.
    - Hapus semua kode dari baris `final String title;` sampai akhir kelas `MyHomePage` pada `menu.dart`.
    - Tambahkan kelas baru bernama `InventoryItem` yang memiliki properti *`name`*, *`icon`*, dan *`color`* dengan *constructor* `InventoryItem(this.name, this.icon, this.color);`.
        <pre>
            class InventoryItem {
                final String name;
                final IconData icon;
                final MaterialColor color;

                InventoryItem(this.name, this.icon, this.color);
            }
        </pre>
    - Tambahkan *widget* baru bernama `InventoryCard` bersifat *stateless* dengan properti *`item`* bertipe `InventoryItem` dengan *contructor* `const InventoryCard(this.item, {super.key});` dan fungsi `build`.
        <pre>
            class InventoryCard extends StatelessWidget {
                final InventoryItem item;
                const InventoryCard(this.item, {super.key});

                @override
                Widget build(BuildContext context) {
                    return Material(
                        color: item.color,
                        child: InkWell(
                            onTap: () {
                                ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text("Kamu telah menekan tombol ${item.name}!")));
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Icon(
                                                item.icon,
                                                color: Colors.white,
                                                size: 30.0,
                                            ),
                                            const Padding(padding: EdgeInsets.all(3)),
                                            Text(
                                                item.name,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(color: Colors.white),
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    );
                }
            }
        </pre>

    - Tambahkan *list* baru dalam kelas `MyHomePage` bernama `items` yang berguna untuk menyimpan tombol-tombol yang akan ditampilkan.
        <pre>
            final List<InventoryItem> items = [
                InventoryItem("Lihat Item", Icons.checklist, Colors.amber),
                InventoryItem("Tambah Item", Icons.add_shopping_cart, Colors.blue),
                InventoryItem("Logout", Icons.logout, Colors.cyan),
            ];
        </pre>

    - Tambahkan fungsi baru dalam kelas `MyHomePage` bernama `build` seperti kode berikut.
        <pre>
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
        </pre>

    - Tes aplikasi dengan menjalankan *command* *`flutter run`*.

</details>