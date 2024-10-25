import 'package:flutter/material.dart';
import 'package:kasir_cafe/services/base_url.dart';
import 'package:kasir_cafe/services/menu.dart';
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
 MenuService menu=MenuService();
 
  List<int> itemCounts = [];
  List<MenuItem> selectedItems = [];
  int totalAmount = 0;
  String customerName = ''; // Nama pelanggan
  String tableNumber = ''; // Nomor meja
  getMenu() async {
    var data =await menu.getMenu();
    setState(() {
      foodItems=data['data'];
    });
    print(foodItems);
  }

  @override
  void initState() {
    super.initState();
    getMenu();
    setState(() {
          if(foodItems!=null){
      
      itemCounts= List.generate(foodItems!.length , (index) => 0);
    } else{
       itemCounts= List.generate(0 , (index) => 0);
    };
    });

    // itemCounts = List.generate(foodItems!.length , (index) => 0);
   
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Menu',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color(0xFF8B0000),
      ),
      body: 
      Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                                  builder: (context) => DaftarTransaksi(), // Mengarahkan ke DaftarTransaksi
                                ),
                              );
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Daftar Transaksi',
                              child: Row(
                                children: [
                                  Icon(Icons.receipt_long, size: 20, color: Colors.black),
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
                                  padding: const EdgeInsets.only(right: 10.0, left: 20.0),
                                  child: Icon(Icons.search, color: Colors.grey),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
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
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Makanan',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  foodItems!=null? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: foodItems!.length,
                    itemBuilder: (context, index) {
                      return menuItem(foodItems![index], index);
                    },
                  ):Text('data kosong'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Minuman',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // ListView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: drinkItems.length,
                  //   itemBuilder: (context, index) {
                  //     return menuItem(drinkItems[index], foodItems.length + index);
                  //   },
                  // ),
                ],
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
              child: Image.network('${baseUrlService().baseUrl}/'+
                item['menu_image_name'],
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text("Rp. "+
                      item['price'].toString(),
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
                        if (itemCounts[index] == 0) {
                          selectedItems.remove(item);
                          totalAmount -= int.parse(item['price'].replaceAll('Rp ', '').replaceAll(',', ''));
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
                itemCounts==true?
                Text(itemCounts[index].toString(), style: TextStyle(fontSize: 16)):Text("0"),
               
                SizedBox(width: 8),
                
                GestureDetector(
                  onTap: () {
                    setState(() {
                      itemCounts[index]++;
                      selectedItems.add(item);
                      totalAmount += int.parse(item['price'].replaceAll('Rp ', '').replaceAll(',', ''));
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

  _showMenuDetailDialog( item) {
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
                  child: Image.network('${baseUrlService().baseUrl}/'+
                    item['menu_image_name'],
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
    Map<String, int> itemCounts = {};

    for (var item in selectedItems) {
      // Menghitung jumlah item yang sama
      itemCounts[item.title] = (itemCounts[item.title] ?? 0) + 1;
    }

    // Menghapus item dari daftar jika jumlahnya 0
    selectedItems.removeWhere((item) => itemCounts[item.title] == 0);

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
            // Nama Pelanggan
            Container(
              width: double.infinity,
              child: Text(
                'Nama Pelanggan : $customerName',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),

            // Nomor Meja
            Container(
              width: double.infinity,
              child: Text(
                'Nomor Meja : $tableNumber',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 8),

            // Total Harga
            Text(
              'Total: Rp $totalAmount',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1, color: Colors.black),
            SizedBox(height: 8),

            // Menampilkan item yang dipilih dengan jumlah yang dipesan
            ...itemCounts.keys.map((itemTitle) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Gak terlalu rapat
                  children: [
                    // Nama menu
                    Text(
                      itemTitle,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 8), // Sedikit jarak antara nama menu dan jumlah

                    // Menampilkan jumlah pesanan
                    Text(
                      itemCounts[itemTitle] == 1 ? '1x' : '${itemCounts[itemTitle]}x', // Format: 2x bukan x2
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Spacer(),  // Memberi jarak antara jumlah dan harga

                    // Harga per item
                    Text(
                      '${selectedItems.firstWhere((item) => item.title == itemTitle).price}',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            }).toList(),

            SizedBox(height: 16),

            // Tombol untuk memesan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Noted(), // Navigasi ke kelas Noted
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B0000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                ),
                child: Text(
                  'Pesan Sekarang',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}