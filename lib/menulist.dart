import 'package:flutter/material.dart';
import 'package:kasir_cafe/Login_page2.dart';
import 'package:kasir_cafe/controllers/login_controller.dart';
import 'package:kasir_cafe/services/base_url.dart';
import 'package:kasir_cafe/services/meja.dart';
import 'package:kasir_cafe/services/menu.dart';
import 'package:kasir_cafe/services/pesan.dart';
import 'daftar_transaksi.dart';
import 'package:kasir_cafe/Noted.dart';

class MenuItem {
  final String imagePath;
  final String title;
  final String price;
  final String description;

  MenuItem(this.imagePath, this.title, this.price, this.description);
}

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  // List<MenuItem> foodItems = [
  //   MenuItem('assets/images/ayam geprek.jpg', 'Ayam Geprek', 'Rp 20000', 'Ayam goreng dengan sambal spesial'),
  //   MenuItem('assets/images/bakso.jpg', 'Bakso', 'Rp 15000', 'Bakso daging sapi dengan kuah segar'),
  //   MenuItem('assets/images/soto ayam.jpg', 'Soto Ayam', 'Rp 25000', 'Soto ayam dengan bumbu khas'),
  //   MenuItem('assets/images/ayam bakar.jpg', 'Ayam Bakar', 'Rp 30000', 'Ayam bakar dengan bumbu rahasia'),
  //   MenuItem('assets/images/sate ayam.jpg', 'Sate Ayam', 'Rp 25000', 'Sate ayam dengan saus kacang'),
  //   MenuItem('assets/images/nasi goreng.jpg', 'Nasi Goreng', 'Rp 20000', 'Nasi goreng dengan sayuran dan telur'),
  // ];

  // List<MenuItem> drinkItems = [
  //   MenuItem('assets/images/jus jeruk.jpg', 'Jus Jeruk', 'Rp 10000', 'Jus jeruk segar dan manis'),
  //   MenuItem('assets/images/es buah.jpg', 'Es Buah', 'Rp 12000', 'Campuran buah segar dalam es'),
  //   MenuItem('assets/images/Es sodagembira.jpg', 'Es Soda Gembira', 'Rp 15000', 'Soda manis dengan campuran buah'),
  //   MenuItem('assets/images/es teh.jpg', 'Es Teh', 'Rp 10000', 'Teh manis dingin yang segar'),
  //   MenuItem('assets/images/es cincau.jpg', 'Es Cincau', 'Rp 12000', 'Cincau hitam dengan sirup manis'),
  //   MenuItem('assets/images/es teler.jpg', 'Es Teler', 'Rp 15000', 'Campuran buah dan susu kental manis'),
  // ];
  List? foodItems;
  MenuService menu = MenuService();
  Pesan pesan = Pesan();
  Meja meja = Meja();
  List dataMeja = [];
  var selectedTable;
  TextEditingController customer_name = TextEditingController();
  LoginController dataLogin = LoginController();
  final formKey = GlobalKey<FormState>();
  List? chart = [];
  String messageError = '';

  Map<String, dynamic> itemCountsBytitle = {};

  List<int> itemCounts = [];
  List selectedItems = [];
  int totalAmount = 0;
  String customerName = ''; // Nama pelanggan
  String tableNumber = ''; // Nomor meja
  getMenu() async {
    var data = await menu.getMenu();
    setState(() {
      foodItems = data['data'];
      itemCounts = List.generate(foodItems!.length, (index) => 0);
    });
    // print(foodItems);
    // print(itemCounts);
  }

  getmejaAvailable() async {
    var dataMejaAvailabe = await meja.mejaAvailable();
    setState(() {
      dataMeja = dataMejaAvailabe;
    });
  }

  @override
  void initState() {
    super.initState();
    getMenu();
    getmejaAvailable();
    print(dataMeja);

    // itemCounts = List.generate(foodItems!.length , (index) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Menu',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xFF8B0000),
        actions: [
          // Menambahkan ikon profil
          Padding(
            padding:
                const EdgeInsets.only(right: 16.0), // Menambahkan padding kanan
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              icon: Icon(Icons.person,
                  color: Colors.white), // Ikon berwarna putih
              onSelected: (String result) {
                if (result == 'Logout') {
                  // Logika untuk logout dan mengarahkan ke halaman login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Login_Page2(), // Ganti dengan halaman login yang sesuai
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
              offset: Offset(0, 50),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          PopupMenuButton<String>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            icon: Icon(Icons.more_vert, color: Colors.grey),
                            onSelected: (String result) {
                              if (result == 'Daftar Transaksi') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DaftarTransaksi(), // Mengarahkan ke DaftarTransaksi
                                  ),
                                );
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Daftar Transaksi',
                                child: Row(
                                  children: [
                                    Icon(Icons.receipt_long,
                                        size: 20, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text('Daftar Transaksi'),
                                  ],
                                ),
                              ),
                            ],
                            offset: Offset(0, 50),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Cari...',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 20.0),
                                    child:
                                        Icon(Icons.search, color: Colors.grey),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8.0),
                                ),
                                cursorColor: Colors.black,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Makanan & Minuman',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    foodItems != null
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: foodItems!.length,
                            itemBuilder: (context, index) {
                              return menuItem(foodItems![index], index);
                            },
                          )
                        : Text('data kosong'),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nomor Meja',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: dataMeja != null
                          ? DropdownButtonFormField(
                              isExpanded: true,
                              value: selectedTable,
                              items: dataMeja.map((r) {
                                return DropdownMenuItem<String>(
                                  child: Text(r["table_number"].toString()),
                                  value: r["table_id"].toString(),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedTable = val;
                                });
                              },
                              hint: Text("Pilih Meja"),
                              validator: (value) {
                                if (value == null) {
                                  return 'Meja harus diisi';
                                } else {
                                  return null;
                                }
                              },
                            )
                          : Text(""),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: TextFormField(
                        controller: customer_name,
                        decoration:
                            InputDecoration(label: Text("Nama Pelanggan")),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Pelanggan harus diisi';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (selectedItems.isNotEmpty) _buildSelectedItems(),
        ],
      ),
    );
  }

  Widget menuItem(item, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${baseUrlService().baseUrl}/' + item['menu_image_name'],
                width: 80,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showMenuDetailDialog(item);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['menu_name'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Rp. ${item['price']}",
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (itemCounts[index] > 0) {
                        itemCounts[index]--;
                        totalAmount -= int.parse(item['price'].toString());
                        // for (var item2 in selectedItems) {
                        // Menghitung jumlah item yang sama
                        itemCountsBytitle[item["menu_name"]] = {
                          'menu_id': item["menu_id"],
                          'quantity': (itemCountsBytitle.isNotEmpty
                                  ? itemCountsBytitle[item["menu_name"]] != null
                                      ? itemCountsBytitle[item["menu_name"]]
                                          ["quantity"]
                                      : 0
                                  : 0) -
                              1
                        };
                        ;
                        // }
                        if (itemCounts[index] == 0) {
                          selectedItems.remove(item);
                          // totalAmount -= int.parse(item['price'].toString());
                          totalAmount = 0;
                          // for (var item2 in selectedItems) {
                          // Menghitung jumlah item yang sama

                          // itemCountsBytitle[item["menu_name"]] =
                          //     (itemCountsBytitle[item["menu_name"]] ?? 0);
                          itemCountsBytitle[item["menu_name"]] = {
                            'menu_id': item["menu_id"],
                            'quantity': 0,
                          };
                          // }
                        }
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 5),
                      ],
                    ),
                    child: Icon(Icons.remove, color: Colors.red),
                  ),
                ),
                SizedBox(width: 8),
                Text(itemCounts[index].toString(),
                    style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      itemCounts[index]++;
                      selectedItems.add(item);
                      totalAmount += int.parse(item['price'].toString());
                      // for (var item2 in selectedItems) {
                      // Menghitung jumlah item yang sama

                      // itemCountsBytitle[item["menu_name"]] =
                      //     (itemCountsBytitle[item["menu_name"]] ?? 0) + 1;
                      itemCountsBytitle[item["menu_name"]] = {
                        'menu_id': item["menu_id"],
                        'quantity': (itemCountsBytitle.isNotEmpty
                                ? itemCountsBytitle[item["menu_name"]] != null
                                    ? itemCountsBytitle[item["menu_name"]]
                                        ["quantity"]
                                    : 0
                                : 0) +
                            1
                      };
                      // }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 5),
                      ],
                    ),
                    child: Icon(Icons.add, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showMenuDetailDialog(item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${baseUrlService().baseUrl}/' + item['menu_image_name'],
                    width: 250,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                item['menu_name'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  );
                }),
              ),
              SizedBox(height: 12),
              Text(
                'Rp ${item['price']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              SizedBox(height: 4), // Menyempitkan jarak
              Text(
                '${item['menu_description']}',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Color(0xFF8B0000),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectedItems() {
    // Menghitung jumlah item yang dipesan
    // Map<String, int> itemCounts = {};

    // for (var item in selectedItems) {
    //   // Menghitung jumlah item yang sama
    //   itemCounts[item["menu_name"]] = (itemCounts[item["menu_name"]] ?? 0) + 1;
    // }

    // Menghapus item dari daftar jika jumlahnya 0
    selectedItems.removeWhere(
        (item) => itemCountsBytitle[item["menu_name"]]["quantity"] == 0);

    // Jika tidak ada item yang dipilih, kembalikan widget kosong
    if (selectedItems.isEmpty) {
      return Container(); // Bisa juga mengembalikan tampilan kosong atau awal
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15.0,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Harga
            Text(
              'Total : Rp $totalAmount',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1, color: Colors.black),
            SizedBox(height: 8),

            // Menampilkan item yang dipilih dengan jumlah yang dipesan
            ...itemCountsBytitle.keys.map((itemTitle) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Gak terlalu rapat
                  children: [
                    // Nama menu
                    Text(
                      itemTitle,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                        width: 8), // Sedikit jarak antara nama menu dan jumlah

                    // Menampilkan jumlah pesanan
                    Text(
                      itemCountsBytitle[itemTitle]["quantity"] == 1
                          ? '1x'
                          : '${itemCountsBytitle[itemTitle]["quantity"]}x', // Format: 2x bukan x2
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Spacer(), // Memberi jarak antara jumlah dan harga

                    // Harga per item
                    Text(
                      (itemCountsBytitle[itemTitle]["quantity"]! *
                              selectedItems.firstWhere((item) =>
                                  item["menu_name"] == itemTitle)["price"])
                          .toString(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 16),

            // Tombol untuk memesan
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // itemCountsBytitle.keys.map((itemTitle) {
                    for (var itemTitle in itemCountsBytitle.keys) {
                      chart!.add({
                        'menu_id': itemCountsBytitle[itemTitle]["menu_id"],
                        'quantity': itemCountsBytitle[itemTitle]["quantity"]
                      });
                    }
                    var user = await dataLogin.getDataLogin();
                    var data = {
                      "user_id": user!.id_user,
                      "table_id": selectedTable,
                      "customer_name": customer_name.text,
                      "detail": chart,
                    };
                    // print(data);

                    var result = await pesan.simpanPesan(data);
                    if (result["status"] == "success") {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotaPage(
                        menuItems: selectedItems, // Ganti dengan daftar menu yang dipilih
                        date: result["data"]["order"]["order_date"] ?? '',
                        customerName: customerName.isNotEmpty ? customerName : 'Dinaa',
                        tableNumber: tableNumber.isNotEmpty ? tableNumber : '69',
                        cashierName: result["data"]["order"]["cashier_name"] ?? 'Nayla',
                      ),
                    ),
                  );



                    } else {
                      setState(() {
                        messageError = 'Gagal memesan';
                      });
                    }
                    print(result);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B0000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                ),
                child: Text(
                  'Pesan Sekarang',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Text(messageError),
          ],
        ),
      ),
    );
  }

  Noted() {}
}
