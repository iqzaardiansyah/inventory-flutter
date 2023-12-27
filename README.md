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
    - Pada file `menu.dart`, ubah sifat kelas `MyHomePage` dari *`stateful`* menjadi *`stateless`* dan ubah baris kode `MyHomePage({Key? key}) : super(key: key);` menjadi `MyHomePage({super.key});`.
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

<details>
    <summary>Tugas 9</summary>

 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?<br>
    Pengambilan data JSON pada aplikasi Django dan Flutter dapat dilakukan tanpa membuat model terlebih dahulu, tergantung pada kebutuhan dan kompleksitas aplikasi.
    - Tanpa Model:
      - Django:
        - Jika data yang ingin diambil bersifat sederhana dan tidak memerlukan manipulasi atau validasi yang kompleks.
        - Pengambilan data dapat dilakukan menggunakan _`request`_ untuk mengambil dan memproses data JSON.
      - Flutter:
        - Flutter dapat mengambil data JSON tanpa mendefinisikan model, terutama jika struktur data sederhana dan tidak memerlukan manipulasi yang rumit.
        - Pengambilan data dapat menggunakan `http` untuk mengambil dan memproses data JSON.
    - Dengan Model
      - Django:
        - Jika data JSON yang akan diambil memerlukan penyimpanan dalam _database_ atau memerlukan validasi data, maka lebih baik mendefinisikan model.
        - Model membantu dalam memodelkan struktur data, memudahkan penyimpanan ke dalam _database_, dan memberikan validasi data.
      - Flutter:
        - Jika aplikasi Flutter yang dibuat lebih kompleks dan memerlukan manajemen _state_ yang baik, mendefinisikan model Dart dapat memudahkan pengembangan.
        - Model membantu dalam memetakan struktur data dengan jelas, memudahkan pengelolaan state, dan memberikan tingkat abstraksi yang baik.
   
 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.<br>
    Cookies adalah mekanisme penyimpanan informasi di sisi klien. Dalam konteks HTTP, server dapat mengirimkan cookie ke klien, dan klien kemudian dapat menyimpan cookie tersebut dan mengirimkannya kembali dalam setiap _request_ berikutnya. Ini memungkinkan server untuk mengenali klien yang sudah terotentikasi atau menyimpan informasi sesi.

 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.<br>
    - Di Flutter, kita dapat menggunakan `http` membuat HTTP _request_ ke server. HTTP _request_ dalam konteks ini bisa berupa GET atau POST tergantung pada kebutuhan.
    - Terima respons dari server, yang berisi data dalam format JSON. Respons ini biasanya berupa string JSON.
    - Gunakan `dart:convert` untuk mengonversi string JSON menjadi objek Dart. Ini melibatkan fungsi `json.decode()` atau model Dart yang dibuat khusus untuk deserialisasi.
    - Jika aplikasi membutuhkan data yang perlu diperbarui secara dinamis, pertimbangkan untuk menggunakan manajemen state seperti Provider untuk mengelola state aplikasi.
    - Jika data diambil secara asinkron, kita dapat menggunakan FutureBuilder atau StreamBuilder untuk menangani pembaruan tampilan saat data tiba.
    - Gunakan widget Flutter seperti ListView, GridView, atau widget khusus untuk menampilkan data yang telah diambil dan diubah menjadi objek Dart.
    
 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.<br>
    - Di aplikasi Flutter, pengguna memasukkan informasi akun, seperti nama pengguna dan kata sandi.
    - Gunakan `http` untuk mengirim data akun ke endpoint registrasi atau login di server Django.
    - Di sisi server Django, terdapat endpoint yang menangani registrasi dan login. Sesuai dengan desain aplikasi Django, endpoint ini akan menerima data akun dari Flutter.
    - Lakukan verifikasi data akun, seperti memeriksa apakah pengguna sudah terdaftar atau apakah kata sandi sesuai.
    - Backend Django mengirim respon ke aplikasi Flutter. Jika proses login berhasil, respon dapat berisi informasi pengguna atau token akses.
    - Di aplikasi Flutter, proses respon dari backend Django. Jika autentikasi berhasil, dapat menyimpan token atau informasi pengguna dalam _state_ aplikasi.
    - Bila autentikasi berhasil, navigasikan pengguna ke tampilan menu atau halaman lain di aplikasi Flutter.

 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.<br>
    - *Container*: *widget* ini menyediakan 'kanvas' untuk programmer membuat sebuah aplikasi Flutter.
    - *Column*: *widget* ini menampilkan *child* dalam format vertikal.
    - *Text*: *widget* ini menampilkan *string* dalam satu baris.
    - *AppBar*: *widget* ini sama seperti *toolbar* pada aplikasi lain yang sering kita gunakan, yang berguna untuk menampilkan judul dan fitur-fitur utama pada aplikasi.
    - *Scaffold*: Digunakan sebagai kerangka dasar untuk sebagian besar aplikasi Flutter.
    - *Row*: *widget* ini menampilkan *child* dalam format horizontal.
    - *Material*: Digunakan sebagai *container* untuk mengimplementasikan desain *Material Design* dalam aplikasi Flutter.
    - *ListView*: Menampilkan daftar *widge*t dalam format *scrollable*. Digunakan ketika daftar item mungkin melebihi ruang layar yang tersedia.
    - *Padding*: Menambahkan ruang kosong atau margin di sekitar *widget child* di dalamnya. Digunakan untuk memberikan ruang antara elemen-elemen dalam tata letak.
    - *GridView*: Menampilkan daftar *widget* dalam format grid. Berguna ketika item perlu diatur dalam grid dengan beberapa kolom.

 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).<br>
    - Buat aplikasi baru bernama `authentication` dengan menjalankan *command* `python manage.py startapp authentication` pada direktori root aplikasi Django.
    - Tambahkan `authentication` ke INSTALLED_APPS pada `settings.py` projek Django.
    - Tambahkan `django-cors-headers` pada requirements.txt dan jalankan *command* `pip install -r requirements.txt` pada lokal dan *virtual environment*.
    - Tambahkan `corsheaders` ke INSTALLED_APPS pada `settings.py` projek Django.
    - Tambahkan `corsheaders.middleware.CorsMiddleware` ke MIDDLEWARE pada `settings.py` projek Django.
    - Tambahkan beberapa variabel berikut ini pada `settings.py` projek Django.
        <pre>
            CORS_ALLOW_ALL_ORIGINS = True
            CORS_ALLOW_CREDENTIALS = True
            CSRF_COOKIE_SECURE = True
            SESSION_COOKIE_SECURE = True
            CSRF_COOKIE_SAMESITE = 'None'
            SESSION_COOKIE_SAMESITE = 'None'
        </pre>
    - Isi `views.py` pada direktori `authentication` dengan kode berikut.
        <pre>
            from django.shortcuts import render
            from django.contrib.auth import authenticate, login as auth_login
            from django.http import JsonResponse
            from django.views.decorators.csrf import csrf_exempt
            from django.contrib.auth import logout as auth_logout
            from django.contrib.auth.models import User
             
            @csrf_exempt
            def login(request):
                username = request.POST['username']
                password = request.POST['password']
                user = authenticate(username=username, password=password)
                if user is not None:
                    if user.is_active:
                        auth_login(request, user)
                        return JsonResponse({
                            "username": user.username,
                            "status": True,
                            "message": "Login sukses!"
                        }, status=200)
                    else:
                        return JsonResponse({
                            "status": False,
                            "message": "Login gagal, akun dinonaktifkan."
                        }, status=401)
                 
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login gagal, periksa kembali email atau kata sandi."
                    }, status=401)
                
            @csrf_exempt
            def logout(request):
                username = request.user.username
                 
                try:
                    auth_logout(request)
                    return JsonResponse({
                        "username": username,
                        "status": True,
                        "message": "Logout berhasil!"
                    }, status=200)
                except:
                    return JsonResponse({
                    "status": False,
                    "message": "Logout gagal."
                    }, status=401)
        </pre>
    - Buat file `urls.py` pada direktori `authentication` dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint login/ dan logout/.
        <pre>
            from django.urls import path
            from .views import *
             
            app_name = 'authentication'
             
            urlpatterns = [
                path('login/', login, name='login'),
                path('logout/', logout, name='logout'),
            ]
        </pre>
    - Tambahkan `path('auth/', include('authentication.urls'))`, pada `urls.py` projek Django.
    - Jalankan *command* `flutter pub add provider && flutter pub add pbp_django_auth` pada direktori projek Flutter.
    - Modifikasi *root widget* untuk menyediakan CookieRequest *library* ke semua *child widgets* dengan menggunakan Provider.
    - Pada direktori projek Flutter, buat file baru bernama `login.dart` pada direktori `lib/screens` dan isi dengan kode berikut.
        <pre>
            import 'package:inventory/screens/menu.dart';
            import 'package:flutter/material.dart';
            import 'package:pbp_django_auth/pbp_django_auth.dart';
            import 'package:provider/provider.dart';
             
            void main() {
                runApp(const LoginApp());
            }
             
            class LoginApp extends StatelessWidget {
            const LoginApp({super.key});
             
            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                    title: 'Login',
                    theme: ThemeData(
                        primarySwatch: Colors.blue,
                ),
                home: const LoginPage(),
                );
                }
            }
             
            class LoginPage extends StatefulWidget {
                const LoginPage({super.key});
                 
                @override
                // ignore: library_private_types_in_public_api
                _LoginPageState createState() => _LoginPageState();
            }
             
            class _LoginPageState extends State<LoginPage> {
                final TextEditingController _usernameController = TextEditingController();
                final TextEditingController _passwordController = TextEditingController();
                 
                @override
                Widget build(BuildContext context) {
                    final request = context.watch<CookieRequest>();
                    return Scaffold(
                        appBar: AppBar(
                            title: const Text('Login'),
                        ),
                        body: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    TextField(
                                        controller: _usernameController,
                                        decoration: const InputDecoration(
                                            labelText: 'Username',
                                        ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    TextField(
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                            labelText: 'Password',
                                        ),
                                        obscureText: true,
                                    ),
                                    const SizedBox(height: 24.0),
                                    ElevatedButton(
                                        onPressed: () async {
                                            String username = _usernameController.text;
                                            String password = _passwordController.text;
                                            final response = await request.login("http://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                            'username': username,
                                            'password': password,
                                            });
                                             
                                            if (request.loggedIn) {
                                                String message = response['message'];
                                                String uname = response['username'];
                                                // ignore: use_build_context_synchronously
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                                );
                                                // ignore: use_build_context_synchronously
                                                ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(
                                                        SnackBar(content: Text("$message Selamat datang, $uname.")));
                                                } else {
                                                // ignore: use_build_context_synchronously
                                                showDialog(
                                                    context: context,
                                                    builder: (context) => AlertDialog(
                                                        title: const Text('Login Gagal'),
                                                        content:
                                                            Text(response['message']),
                                                        actions: [
                                                            TextButton(
                                                                child: const Text('OK'),
                                                                onPressed: () {
                                                                    Navigator.pop(context);
                                                                },
                                                            ),
                                                        ],
                                                    ),
                                                );
                                            }
                                        },
                                        child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Icon(Icons.login),
                                                SizedBox(width: 8.0),
                                                Text('Login'),
                                            ],
                                        )
                                    ),
                                ],
                            ),
                        ),
                    );
                }
            } 
        </pre>
    - Modifikasi `main.dart` agar ketika pengguna membuka aplikasi, pengguna akan diarahkan ke halaman login.
    - Pada direktori projek Flutter, buat folder baru bernama `lib/mmodels` dan buat file baru bernama `barang.dart` dalam direktori `lib/models`.
    - Isi `barang.dart` dengan kode hasil penyalinan hasil *endpoint* JSON projek Django ke situs web Quicktype.
    - Jalankan *command* `flutter pub add http` pada direktori projek Flutter.
    - Modifikasi file `android/app/src/main/AndroidManifest.xml` pada direktori projek Flutter agar aplikasi dapat mengakses internet.
    - Pada direktori projek Flutter, buat file baru pada direktori `lib/screens` bernama `list_barang.dart` dan isi dengan kode berikut.
        <pre>
            import 'package:flutter/material.dart';
            import 'package:http/http.dart' as http;
            import 'dart:convert';
            import 'package:inventory/models/barang.dart';
            import 'package:inventory/widgets/left_drawer.dart';
             
            class BarangPage extends StatefulWidget {
                const BarangPage({Key? key}) : super(key: key);
                 
                @override
                // ignore: library_private_types_in_public_api
                _BarangPageState createState() => _BarangPageState();
            }
             
            class _BarangPageState extends State<BarangPage> {
                Future<List<Barang>> fetchBarang() async {
                    var url = Uri.parse(
                        // ganti ke 'http://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/json-usr/'
                        // untuk filter berdasarkan user, tetapi karena di versi deploy tidak bisa
                        // login jadi filter user-nya tidak bekerja padahal kalau di local bisa jalan.
                        'http://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/json/');
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
                                                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                            }
                        );
                    )
                }
            }
             
            class DetailPage extends StatelessWidget {
                final Barang barang;
                 
                const DetailPage({Key? key, required this.barang}) : super(key: key);
                 
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
        </pre>
    - Pada direktori Django, edit file `main/views.py` dengan menambahkan fungsi baru untuk menambahkan item menggunakan aplikasi Flutter dan fungsi untuk mengirim data JSON item-item yang dibuat oleh pengguna yang login.
        <pre>
            ...
            @csrf_exempt
            def create_product_flutter(request):
                if request.method == 'POST':
                    data = json.loads(request.body)
                    new_product = Item.objects.create(
                        user = request.user,
                        name = data["name"],
                        amount = int(data["amount"]),
                        price = int(data["price"]),
                        description = data["description"]
                    )
                     
                    new_product.save()
                     
                    return JsonResponse({"status": "success"}, status=200)
                else:
                    return JsonResponse({"status": "error"}, status=401)
                    
            def show_json_user(request):
                data = Item.objects.all().filter(user = request.user)
                return HttpResponse(serializers.serialize("json", data), content_type="application/json")
        </pre>
    - Tambahkan *path* baru pada `main/urls.py` dengan kode berikut.
        <pre>
            path('create-flutter/', create_product_flutter, name='create_product_flutter'),
            path('json-usr/', show_json_user, name='show_json_user'),
        </pre>
    - Pada direktori Flutter, modifikasi file `inventorylist_form.dart` agar halaman menggunakan `CookieRequest` menggunakan kode berikut.
        <pre>
            ...
            final request = context.watch<CookieRequest>();
             
            ...
        </pre>
    - Ubah fungsi `onPressed: ()` pada file `inventorylist_form.dart` agar dapat membuat item langsung ke BackEnd Django.
        <pre>
            ...
            onPressed: () async {
                if (_formKey.currentState!.validate()) {
                    final response = await request.postJson("http://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/create-flutter/", jsonEncode(<String, String>{
                                  'name': _name,
                                  'amount': _amount.toString(),
                                  'price': _price.toString(),
                                  'description': _description,
                    }));
                    if (response['status'] == 'success') {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                        content: Text("Produk baru berhasil disimpan!"),
                        ));
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                    } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                        content: Text("Terdapat kesalahan, silakan coba lagi."),
                        ));
                    }
                }
            },
            ...
        </pre>
    - Pada direktori projek Flutter, edit file `lib/widgets/inventory_card.dart` agar halaman menggunakan `CookieRequest` dan ubah `onTap: () {...}` pada widget `Inkwell` menjadi `onTap: () async {...}` agar widget `Inkwell` dapat melakukan proses logout secara asinkronus.
    - Tambahkan kode berikut pada `onTap: () async {...}` agar tombol logout memiliki fungsi logout.
        <pre>
            ...
            else if (item.name == "Logout") {
              final response = await request.logout("http://iqza-ardiansyah-tugas.pbp.cs.ui.ac.id/auth/logout/");
              String message = response["message"];
              if (response['status']) {
                String uname = response["username"];
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
            }
            ...
        </pre>
</details>