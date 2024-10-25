import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal

class DaftarTransaksi extends StatefulWidget {
  @override
  _DaftarTransaksiState createState() => _DaftarTransaksiState();
}

class _DaftarTransaksiState extends State<DaftarTransaksi> {
  final List<Map<String, dynamic>> transaksiList = [
    // Transaksi 1
    {
      'namaPelanggan': 'Dina',
      'tanggal': '01-03-2024',
      'nomorMeja': '15',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Ayam Geprek', 'harga': 25000, 'jumlah': 2},
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 1},
      ],
      'totalTunai': 80000,
      'kembalian': 10000,
    },
    // Transaksi 2
    {
      'namaPelanggan': 'Angga',
      'tanggal': '01-03-2024',
      'nomorMeja': '8',
      'Kasir': 'Fitri',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Mie Ayam', 'harga': 15000, 'jumlah': 3},
        {'namaMenu': 'Es Teh', 'harga': 8000, 'jumlah': 2},
      ],
      'totalTunai': 75000,
      'kembalian': 6000,
    },
    // Transaksi 3
    {
      'namaPelanggan': 'Kiaa',
      'tanggal': '01-03-2024',
      'nomorMeja': '3',
      'Kasir': 'Karin',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Soto Ayam', 'harga': 22000, 'jumlah': 1},
        {'namaMenu': 'Jus Jeruk', 'harga': 12000, 'jumlah': 1},
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 1},
      ],
      'totalTunai': 64000,
      'kembalian': 0,
    },
    // Transaksi 4
    {
      'namaPelanggan': 'Salsa',
      'tanggal': '10-03-2024',
      'nomorMeja': '19',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Ayam Geprek', 'harga': 25000, 'jumlah': 1},
        {'namaMenu': 'Es Buah', 'harga': 10000, 'jumlah': 2},
        {'namaMenu': 'Mie Goreng', 'harga': 15000, 'jumlah': 1},
      ],
      'totalTunai': 70000,
      'kembalian': 10000,
    },
    // Transaksi 5
    {
      'namaPelanggan': 'Bimaa',
      'tanggal': '11-03-2024',
      'nomorMeja': '12',
      'Kasir': 'Fitri',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 2},
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 1},
        {'namaMenu': 'Jus Mangga', 'harga': 10000, 'jumlah': 1},
      ],
      'totalTunai': 100000,
      'kembalian': 10000,
    },
    // Transaksi 6
    {
      'namaPelanggan': 'Rina',
      'tanggal': '15-04-2024',
      'nomorMeja': '1',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Jus Jeruk', 'harga': 12000, 'jumlah': 2},
        {'namaMenu': 'Soda Gembira', 'harga': 10000, 'jumlah': 2},
      ],
      'totalTunai': 44000,
      'kembalian': 0,
    },
    // Transaksi 7
    {
      'namaPelanggan': 'Tina',
      'tanggal': '15-04-2024',
      'nomorMeja': '17',
      'Kasir': 'Karin',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Nasi Ayam', 'harga': 22000, 'jumlah': 1},
        {'namaMenu': 'Es Teh', 'harga': 8000, 'jumlah': 3},
      ],
      'totalTunai': 62000,
      'kembalian': 4000,
    },
    // Transaksi 8
    {
      'namaPelanggan': 'Yusuf',
      'tanggal': '29-04-2024',
      'nomorMeja': '6',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Mie Ayam', 'harga': 15000, 'jumlah': 2},
        {'namaMenu': 'Soto Ayam', 'harga': 22000, 'jumlah': 1},
        {'namaMenu': 'Es Cendol', 'harga': 9000, 'jumlah': 1},
      ],
      'totalTunai': 58000,
      'kembalian': 2000,
    },
    // Transaksi 9
    {
      'namaPelanggan': 'Ayu',
      'tanggal': '01-05-2024',
      'nomorMeja': '10',
      'Kasir': 'Fitri',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Soda Gembira', 'harga': 10000, 'jumlah': 2},
        {'namaMenu': 'Es Cincau', 'harga': 8000, 'jumlah': 1},
      ],
      'totalTunai': 28000,
      'kembalian': 0,
    },
    // Transaksi 10
    {
      'namaPelanggan': 'Zaki',
      'tanggal': '15-06-2024',
      'nomorMeja': '7',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 1},
        {'namaMenu': 'Es Teler', 'harga': 12000, 'jumlah': 1},
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 1},
      ],
      'totalTunai': 62000,
      'kembalian': 10000,
    },
    // Transaksi 11
    {
      'namaPelanggan': 'Fahmi',
      'tanggal': '29-07-2024',
      'nomorMeja': '5',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Ayam Geprek', 'harga': 25000, 'jumlah': 2},
        {'namaMenu': 'Mie Goreng', 'harga': 15000, 'jumlah': 1},
      ],
      'totalTunai': 65000,
      'kembalian': 5000,
    },
    // Transaksi 12
    {
      'namaPelanggan': 'Nina',
      'tanggal': '05-08-2024',
      'nomorMeja': '9',
      'Kasir': 'Karin',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Soto Ayam', 'harga': 22000, 'jumlah': 1},
        {'namaMenu': 'Jus Mangga', 'harga': 10000, 'jumlah': 2},
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 1},
      ],
      'totalTunai': 52000,
      'kembalian': 0,
    },
    // Transaksi 13
    {
      'namaPelanggan': 'Sandy',
      'tanggal': '15-09-2024',
      'nomorMeja': '13',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Es Buah', 'harga': 10000, 'jumlah': 2},
        {'namaMenu': 'Ayam Geprek', 'harga': 25000, 'jumlah': 1},
        {'namaMenu': 'Mie Ayam', 'harga': 15000, 'jumlah': 1},
      ],
      'totalTunai': 60000,
      'kembalian': 5000,
    },
    // Transaksi 14
    {
      'namaPelanggan': 'Hafiz',
      'tanggal': '25-09-2024',
      'nomorMeja': '2',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Sate Ayam', 'harga': 30000, 'jumlah': 2},
        {'namaMenu': 'Es Teh', 'harga': 8000, 'jumlah': 2},
      ],
      'totalTunai': 76000,
      'kembalian': 4000,
    },
    // Transaksi 15
    {
      'namaPelanggan': 'Lina',
      'tanggal': '29-09-2024',
      'nomorMeja': '20',
      'Kasir': 'Karin',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 1},
        {'namaMenu': 'Soto Ayam', 'harga': 22000, 'jumlah': 1},
      ],
      'totalTunai': 52000,
      'kembalian': 3000,
    },
    // Transaksi 16
    {
      'namaPelanggan': 'Andi',
      'tanggal': '15-10-2024',
      'nomorMeja': '14',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Bakso', 'harga': 25000, 'jumlah': 1},
        {'namaMenu': 'Teh Manis', 'harga': 6000, 'jumlah': 2},
      ],
      'totalTunai': 37000,
      'kembalian': 3000,
    },
    // Transaksi 17
    {
      'namaPelanggan': 'Farah',
      'tanggal': '18-10-2024',
      'nomorMeja': '18',
      'Kasir': 'Fitri',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Soto Betawi', 'harga': 35000, 'jumlah': 1},
        {'namaMenu': 'Es Campur', 'harga': 12000, 'jumlah': 1},
      ],
      'totalTunai': 47000,
      'kembalian': 0,
    },
    // Transaksi 18
    {
      'namaPelanggan': 'Niko',
      'tanggal': '21-10-2024',
      'nomorMeja': '4',
      'Kasir': 'Nayla',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 2},
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 1},
      ],
      'totalTunai': 70000,
      'kembalian': 5000,
    },
    // Transaksi 19
    {
      'namaPelanggan': 'Mira',
      'tanggal': '23-10-2024',
      'nomorMeja': '11',
      'Kasir': 'Karin',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Es Kelapa Muda', 'harga': 12000, 'jumlah': 1},
        {'namaMenu': 'Ayam Geprek', 'harga': 25000, 'jumlah': 2},
      ],
      'totalTunai': 62000,
      'kembalian': 3000,
    },
    // Transaksi 20
    {
      'namaPelanggan': 'Yuni',
      'tanggal': '25-10-2024',
      'nomorMeja': '16',
      'Kasir': 'Fitri',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Sate Ayam', 'harga': 30000, 'jumlah': 1},
        {'namaMenu': 'Es Teler', 'harga': 12000, 'jumlah': 1},
      ],
      'totalTunai': 42000,
      'kembalian': 2000,
    },
  ];

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  List<Map<String, dynamic>> _filteredTransaksiList() {
    if (_selectedDate == null) {
      return transaksiList;
    } else {
      String formattedDate = DateFormat('dd-MM-yyyy').format(_selectedDate!);
      return transaksiList
          .where((transaksi) => transaksi['tanggal'] == formattedDate)
          .toList();
    }
  }

  void _showDetails(BuildContext context, Map<String, dynamic> transaksi) {
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
                child: Text(
                  'Rincian Transaksi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(color: Colors.black),
              SizedBox(height: 4),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...transaksi['menu'].map<Widget>((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item['namaMenu']}', style: TextStyle(fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item['harga']} x ${item['jumlah']}', style: TextStyle(fontSize: 12)),
                            Text('Rp${item['harga'] * item['jumlah']}', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
                Divider(color: Colors.black),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(
                      'Rp${transaksi['totalTunai'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                if (transaksi['status'] == 'Lunas') ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tunai', style: TextStyle(fontSize: 14)),
                      Text(
                        'Rp${(transaksi['totalTunai'] + transaksi['kembalian']).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kembalian', style: TextStyle(fontSize: 14)),
                      Text(
                        'Rp${transaksi['kembalian'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Tambahkan logika untuk menghapus transaksi
                // Contoh: hapusTransaksi(transaksi);
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red, // Mengubah warna tombol menjadi merah
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Aksi yang diinginkan ketika judul ditekan
            // Misalnya, mengatur ulang tanggal yang dipilih atau melakukan refresh
            setState(() {
              _selectedDate = null; // Mengatur ulang tanggal
            });
          },
          child: Text('Daftar Transaksi',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),),
          )
           // Judul yang bisa ditekan
        ),
        backgroundColor: Color(0xFF8B0000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xFF8B0000)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 8), // Memberikan jarak di sebelah kiri ikon kalender
                          Icon(Icons.calendar_today, color: Color(0xFF8B0000)),
                          SizedBox(width: 15), // Jarak antara ikon dan teks
                          Text(
                            _selectedDate == null
                                ? 'Pilih Tanggal'
                                : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _filteredTransaksiList().asMap().entries.map((entry) {
                    int index = entry.key;
                    var transaksi = entry.value;
                    Color statusColor = transaksi['status'] == 'Lunas' ? Colors.green : Colors.red;

                    return GestureDetector(
                      onTap: () => _showDetails(context, transaksi),
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('${index + 1}. ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Angka bold
                                        Text(
                                          '${transaksi['namaPelanggan']}',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Nama pelanggan bold
                                        ),
                                        SizedBox(width: 4), // Ubah jarak menjadi lebih kecil
                                        Text(
                                          ' - ', // Tanda penghubung
                                          style: TextStyle(color: Colors.black, fontSize: 14), // Tanda penghubung hitam
                                        ),
                                        SizedBox(width: 4), // Ubah jarak menjadi lebih kecil
                                        Text(
                                          '${transaksi['status']}',
                                          style: TextStyle(color: statusColor, fontSize: 14, fontWeight: FontWeight.bold), // Status
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Tanggal: ${transaksi['tanggal']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'No Meja: ${transaksi['nomorMeja']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Kasir: ${transaksi['Kasir']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10), // Jarak antara text dan arrow
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20, // Ukuran ikon diperkecil
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
