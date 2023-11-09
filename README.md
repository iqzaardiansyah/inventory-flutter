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

<details>
    <summary>Tugas 8</summary>
    
 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
    - `Navigator.push()`: 
        - Digunakan untuk menambahkan halaman baru ke tumpukan navigasi.
        - Ketika kita menggunakan `Navigator.push()`, halaman baru ditambahkan ke atas tumpukan navigasi, dan pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol "Kembali" pada perangkat mereka.
        - Metode ini berguna ketika kita ingin menambahkan halaman baru ke dalam tumpukan dan memungkinkan pengguna untuk kembali ke halaman sebelumnya.
    - `Navigator.pushReplacement()`: 
        - Digunakan untuk menambahkan halaman baru ke tumpukan navigasi, tetapi perbedaannya dengan `Navigator.push()` adalah `Navigator.pushReplacement()` mengganti halaman yang baru saja diakses pengguna dengan halaman baru.
        - Metode ini berguna ketika kita ingin menggantikan halaman yang baru saja diakses pengguna dengan halaman baru, sehingga ketika pengguna menekan tombol "Kembali", pengguna tidak akan kembali ke halaman yang baru pengguna akses, melainkan halaman sebelum halaman yang baru pengguna akses.

 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
    - Single-child layout widgets:
      - Align: Widget yang menyelaraskan *child*-nya dengan dirinya sendiri dan secara opsional mengubah ukuran dirinya sendiri berdasarkan ukuran *child* tersebut.
      - AspectRatio: Widget yang mencoba mengubah ukuran *child*-nya ke rasio aspek tertentu.
      - Baseline: Kontainer yang memosisikan *child*-nya sesuai dengan *baseline child* tersebut.
      - Center: Kontainer yang memosisikan *child*-nya di tengah.
      - ConstrainedBox: Widget yang memberikan batasan tambahan pada *child*-nya.
      - Container: Widget serbaguna yang dapat digunakan untuk mengatur tata letak dan styling.
      - CustomSingleChildLayout: Widget yang tata letak *child*-nya diatur menggunakan pengaturan kustom.
      - Expanded: Digunakan dalam Row atau Column untuk mengatur bagian dari tata letak yang akan mengambil ruang ekstra yang tersisa.
      - FittedBox: Menskalakan dan memposisikan *child*-nya di dalam dirinya sendiri sesuai dengan ukuran ruang yang tersedia.
      - FractionallySizedBox: Widget yang mengubah ukuran *child*-nya hingga sebagian kecil dari total ruang yang tersedia.
      - IntrinsicHeight: Widget yang mengubah ukuran *child*-nya sesuai dengan tinggi intrinsik *child* tersebut.
      - IntrinsicWidth: Widget yang mengubah ukuran *child*-nya sesuai dengan lebar intrinsik *child* tersebut.
      - LimitedBox: Sebuah kotak yang membatasi ukurannya hanya jika tidak dibatasi.
      - Offstage: Sebuah widget yang menampilkan *child*-nya seolah-olah berada di pohon.
      - OverflowBox: Widget yang menerapkan batasan berbeda pada *child*-nya.
      - Padding: Widget yang menyisipkan *child*-nya berdasarkan padding yang diberikan.
      - SizedBox: Sebuah kotak dengan ukuran tertentu. Jika diberikan sebuah *child*, widget ini memaksa *child*-nya untuk memiliki lebar dan/atau tinggi tertentu.
      - SizedOverflowBox: Widget dengan ukuran tertentu dan meneruskan batasannya ke *child*-nya.
      - Transform: Widget yang digunakan untuk mentransformasi atau memodifikasi tampilan dan tata letak dari widget di dalamnya.
    - Multi-child layout widgets:
      - Column: Widget yang digunakan untuk mengatur widget secara vertikal.
      - CustomMultiChildLayout: Widget yang menggunakan pengaturan kustom untuk mengubah ukuran dan memposisikan *children*-nya.
      - Flow: Widget yang mengatur widget dalam arah horizontal atau vertikal, dan widget yang tidak muat di baris akan dipindahkan ke baris berikutnya.
      - GridView: Digunakan untuk menampilkan daftar item dalam grid, dengan baris dan kolom yang dapat dikonfigurasi.
      - IndexedStack: Tumpukan yang menampilkan satu *child* dari tumpukan *child* .
      - LayoutBuilder: Membangun pohon widget yang dapat bergantung pada ukuran widget induk.
      - ListBody: Widget yang menyusun *children*-nya secara berurutan sepanjang sumbu tertentu.
      - ListView:  Widget yang memungkinkan kita untuk mengatur daftar berjejer dengan widget yang bisa di-scroll.
      - Row: Widget yang digunakan untuk mengatur widget secara horizontal.
      - Stack: Widget yang memungkinkan kita menumpuk widget di atas satu sama lain.
      - Table: Menampilkan widget *child* dalam baris dan kolom.
      - Wrap: Widget yang digunakan untuk mengatur widget dalam baris horizontal dan beralih ke baris baru ketika ruang terbatas.
    - Sliver widgets:
      - CupertinoSliverNavigationBar: Bilah navigasi bergaya iOS.
      - CustomScrollView: ScrollView yang membuat efek *scroll* khusus menggunakan sliver.
      - SliverAppBar: AppBar yang terintegrasi dengan CustomScrollView.
      - SliverChildBuilderDelegate: *delegate* yang digunakan dalam Flutter untuk membangun daftar item di dalam widget CustomScrollView dengan menggunakan *builder function*.
      - SliverChildListDelegate: *delegate* yang digunakan dalam Flutter untuk membangun daftar item di dalam widget CustomScrollView dengan menggunakan daftar eksplisit.
      - SliverFixedExtentList: Sliver yang menempatkan beberapa *box children* dengan luas sumbu utama yang sama dalam array linier.
      - SliverGrid: Sebuah sliver yang menempatkan beberapa *box children* dalam susunan dua dimensi.
      - SliverList: Sliver yang menempatkan beberapa *box children* dalam array linier di sepanjang sumbu utama.
      - SliverPadding: Sliver yang menerapkan *padding* pada setiap sisi sliver lainnya.
      - SliverPersistentHeader: Sliver yang ukurannya bervariasi ketika sliver di-scroll ke tepi area pandang yang berlawanan dengan GrowthDirection sliver.
      - SliverToBoxAdapter: Sliver yang berisi satu widget kotak.

 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!<br>
    TextFormField, karena TextFormField adalah widget praktis yang nge-*wrap* sebuah widget TextField di dalam sebuah FormField.

 4. Bagaimana penerapan *clean architecture* pada aplikasi Flutter?<br>
    Penerapan *clean architecture* dalam Flutter dilakukan dengan mengelompokkan file-file yang memiliki peran identikal sehingga memudahkan proses *maintenance*, mengurangi waktu pengembangan, dan sebagainya.
   
 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
    - Buat empat direktori baru bernama screens, widgets, models, dan storage dalam direktori lib.
    - Pindahkan file `menu.dart` dan buat file baru bernama `inventorylist_form.dart` dalam direktori screens.
    - Buat tiga file baru bernama `inventory_card.dart`, `left_drawer.dart`, dan `barang_card.dart` dalam direktori widgets.
    - Buat satu file bernama `barang.dart` dalam direktori models dan satu file lagi bernama `storage.dart` dalam direktori storage.
    - Pindahkan *class* InventoryItem dan InventoryCard dari `menu.dart` ke `inventory_card.dart` dan *import* `inventory_card.dart` pada file `menu.dart`.
    - *Import* `left_drawer.dart` pada file `menu.dart` dan tambahkan drawer pada AppBar `menu.dart` menggunakan `left_drawer.dart`.
    - Isi `left_drawer.dart` dengan kode berikut.
        <pre>
            import 'package:flutter/material.dart';
            import 'package:inventory/screens/menu.dart';
            import 'package:inventory/screens/inventorylist_form.dart';
            import 'package:inventory/widgets/barang_card.dart';
             
            class LeftDrawer extends StatelessWidget {
                const LeftDrawer({super.key});
                    
                @override
                Widget build(BuildContext context) {
                    return Drawer(
                        child: ListView(
                            children: [
                                const DrawerHeader(
                                    decoration: BoxDecoration(
                                    color: Colors.grey,
                                    ),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text(
                                                'Inventory',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                                ListTile(
                                    leading: const Icon(Icons.home_outlined),
                                    title: const Text('Halaman Utama'),
                                    onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                            builder: (context) => MyHomePage(),
                                        ));
                                    },
                                ),
                                ListTile(
                                    leading: const Icon(Icons.add_shopping_cart),
                                    title: const Text('Tambah Item'),
                                    onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                            builder: (context) => const InventoryFormPage(),
                                        ));
                                    },
                                ),
                                ListTile(
                                    leading: const Icon(Icons.checklist),
                                    title: const Text('Lihat Item'),
                                    onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                            builder: (context) => const BarangList(),
                                        ));
                                    },
                                ),
                            ],
                        ),
                    );
                }
            }
        </pre>
    - Isi `inventorylist_form.dart` dengan kode berikut.
        <pre>
            import 'package:flutter/material.dart';
            import 'package:inventory/models/barang.dart';
            import 'package:inventory/screens/menu.dart';
            import 'package:inventory/storage/storage.dart';
            import 'package:inventory/widgets/left_drawer.dart';
             
            class InventoryFormPage extends StatefulWidget {
                const InventoryFormPage({super.key});
                @override
                State<InventoryFormPage> createState() => _InventoryFormPageState();
            }
            class _InventoryFormPageState extends State<InventoryFormPage> {
                final _formKey = GlobalKey<FormState>();
                String _name = "";
                String _price = "0";
                String _amount = "0";
                String _description = "";
                @override
                Widget build(BuildContext context) {
                    return Scaffold(
                    appBar: AppBar(
                            title: const Center(
                            child: Text(
                                'Form Tambah Item',
                            ),
                        ),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                    ),
                    drawer: const LeftDrawer(),
                    body: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child:
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding (
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                            hintText: "Nama Produk",
                                            labelText: "Nama Produk",
                                            border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                            setState(() {
                                            _name = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Nama tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                            hintText: "Harga",
                                            labelText: "Harga",
                                            border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                            setState(() {
                                            _price = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Harga tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) == null) {
                                            return "Harga harus berupa angka!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                            hintText: "Jumlah",
                                            labelText: "Jumlah",
                                            border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                            setState(() {
                                            _amount = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Jumlah tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) == null) {
                                            return "Jumlah harus berupa angka!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                            hintText: "Deskripsi",
                                            labelText: "Deskripsi",
                                            border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                            setState(() {
                                            _description = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Deskripsi tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                                                ),
                                                onPressed: () {
                                                    if (_formKey.currentState!.validate()) {
                                                        Barang barang = Barang(
                                                            nama: _name,
                                                            harga: _price,
                                                            amount: _amount,
                                                            description: _description);
                                                        ItemsStorage.barangs.add(barang);
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                                return AlertDialog(
                                                                    title: const Text('Item berhasil tersimpan'),
                                                                    content: SingleChildScrollView(
                                                                        child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                            Text('Nama: $_name'),
                                                                            Text('Harga: $_price'),
                                                                            Text('Jumlah: $_amount'),
                                                                            Text('Deskripsi: $_description'),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                    actions: [
                                                                        TextButton(
                                                                            child: const Text('OK'),
                                                                            onPressed: () {
                                                                            Navigator.pop(context);
                                                                            },
                                                                        ),
                                                                    ],
                                                                );
                                                            },
                                                        );
                                                        _formKey.currentState!.reset();
                                                    }
                                                },
                                                child: const Text(
                                                    "Save",
                                                    style: TextStyle(color: Colors.white),
                                                ),
                                            ),
                                            const SizedBox(width: 50),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                                                ),
                                                onPressed: () {
                                                    _formKey.currentState!.reset();
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                            builder: (context) => MyHomePage(),
                                                        ));
                                                },
                                                child: const Text(
                                                    "Back",
                                                    style: TextStyle(color: Colors.white),
                                                ),
                                            ),
                                        ],
                                    )),
                                ),
                            ])),
                        ),
                    );
                }
            }
        </pre>
    - Isi `barang.dart` dengan kode berikut.
        <pre>
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
        </pre>
    - Isi `storage.dart` dengan kode berikut.
        <pre>
            import 'package:inventory/models/barang.dart';
             
            class ItemsStorage {
                static List<Barang> barangs = [];
            }
        </pre>
    - Isi `barang_card.dart` dengan kode berikut.
        <pre>
            import 'package:flutter/material.dart';
            import 'package:inventory/models/barang.dart';
            import 'package:inventory/storage/storage.dart';
            import 'package:inventory/widgets/left_drawer.dart';
             
            class BarangList extends StatelessWidget {
                const BarangList({Key? key}) : super(key: key);
                 
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

        </pre>
    - Tambahkan fungsi pada `inventory_card.dart` sehingga ketika pengguna menekan tombol Tambah Item, pengguna akan dialihkan ke halaman Tambah Item dan ketika pengguna menekan tombol Lihat Item, pengguna akan dialihkan ke halaman Lihat Item.
        <pre>
            ...
            if (item.name == "Tambah Item") {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InventoryFormPage()));
            } else if (item.name == "Lihat Item") {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BarangList()));
            }
            ...
        </pre>
    - Tambahkan drawer pada file `inventorylist_form.dart` dan `barang_card.dart` untuk menambahkan drawer pada AppBar halaman.
    - Tambahkan juga tombol kembali pada file `inventorylist_form.dart` agar pengguna bisa dengan mudah kembali ke halaman utama.
</details>