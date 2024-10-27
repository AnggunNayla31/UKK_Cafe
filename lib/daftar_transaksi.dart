import 'package:flutter/material.dart';

class DaftarTransaksi extends StatelessWidget {
  final List<Map<String, dynamic>> transaksiList = [
    {
      'namaPelanggan': 'Dina',
      'tanggal' : '19-05-2024',
      'nomorMeja' : '5',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 2},
        {'namaMenu': 'Es Teh', 'harga': 10000, 'jumlah': 1},
      ],
      'totalTunai': 50000,
      'kembalian': 2000,
    },
    {
      'namaPelanggan': 'Andi',
      'tanggal' : '18-05-2024',
      'nomorMeja' : '3',
      'status': 'Belum Lunas',
      'menu': [
        {'namaMenu': 'Ayam Geprek', 'harga': 20000, 'jumlah': 1},
        {'namaMenu': 'Jus Jeruk', 'harga': 10000, 'jumlah': 2},
        {'namaMenu': 'Es Buah', 'harga' : 12000, 'jumlah' : 1},
      ],
      'totalTunai': 52000,
      'kembalian': 8000,
    },
    {
      'namaPelanggan': 'Bima',
      'tanggal' : '17-05-2024',
      'nomorMeja' : '7',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Bakso', 'harga': 15000, 'jumlah': 3},
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 2},
      ],
      'totalTunai': 105000,
      'kembalian': 0,
    },
    {
      'namaPelanggan': 'Citra',
      'tanggal' : '16-05-2024',
      'nomorMeja' : '2',
      'status': 'Belum Lunas',
      'menu': [
        {'namaMenu': 'Sate Ayam', 'harga': 25000, 'jumlah': 4},
        {'namaMenu': 'Es Cincau', 'harga': 12000, 'jumlah': 5},
        {'namaMenu': 'Soto Ayam', 'harga': 25000, 'jumlah': 2},
        {'namaMenu': 'Es Soda Gembira', 'harga': 12000, 'jumlah': 1},
      ],
      'totalTunai': 222000,
      'kembalian': 3000,
    },
    {
      'namaPelanggan': 'Eka',
      'tanggal' : '15-05-2024',
      'nomorMeja' : '6',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Sate Ayam', 'harga': 25000, 'jumlah': 1},
        {'namaMenu': 'Es Teh', 'harga': 10000, 'jumlah': 2},
      ],
      'totalTunai': 45000,
      'kembalian': 0,
    },
    {
      'namaPelanggan': 'Fajar',
      'tanggal' : '14-05-2024',
      'nomorMeja' : '4',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Soto Ayam', 'harga': 25000, 'jumlah': 1},
        {'namaMenu': 'Ayam Geprek', 'harga': 20000, 'jumlah': 3},
      ],
      'totalTunai': 85000,
      'kembalian': 5000,
    },
    {
      'namaPelanggan': 'Pionaa',
      'tanggal' : '13-05-2024',
      'nomorMeja' : '1',
      'status': 'Belum Lunas',
      'menu': [
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 2},
        {'namaMenu': 'Es Teler', 'harga': 15000, 'jumlah': 2},
      ],
      'totalTunai': 70000,
      'kembalian': 0,
    },
    {
      'namaPelanggan': 'Kaniaa',
      'tanggal' : '12-05-2024',
      'nomorMeja' : '8',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Bakso', 'harga': 15000, 'jumlah': 1},
        {'namaMenu': 'Ayam Bakar', 'harga': 30000, 'jumlah': 5},
      ],
      'totalTunai': 165000,
      'kembalian': 5000,
    },
    {
      'namaPelanggan': 'Wikan',
      'tanggal' : '11-05-2024',
      'nomorMeja' : '9',
      'status': 'Belum Lunas',
      'menu': [
        {'namaMenu': 'Nasi Goreng', 'harga': 20000, 'jumlah': 1},
        {'namaMenu': 'Ayam Geprek', 'harga': 20000, 'jumlah': 1},
        {'namaMenu': 'Soto Ayam', 'harga': 25000, 'jumlah': 1},
      ],
      'totalTunai': 65000,
      'kembalian': 0,
    },
    {
      'namaPelanggan': 'Kiaa',
      'tanggal' : '10-05-2024',
      'nomorMeja' : '10',
      'status': 'Lunas',
      'menu': [
        {'namaMenu': 'Bakso', 'harga': 15000, 'jumlah': 4},
        {'namaMenu': 'Es Buah', 'harga': 12000, 'jumlah': 2},
        {'namaMenu': 'Es Cincau', 'harga': 12000, 'jumlah': 2},
      ],
      'totalTunai': 108000,
      'kembalian': 2000,
    },
  ];

  void _showDetails(BuildContext context, Map<String, dynamic> transaksi) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Membulatkan sudut pop-up
          ),
          title: Column(
            children: [
              Center(
                child: Text(
                  'Rincian Transaksi', // Judul di tengah
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15, // Ukuran font judul
                  ),
                ),
              ),
              Divider(color: Colors.black), // Garis hitam di bawah judul
              SizedBox(height: 8), // Mengurangi jarak antara judul dan daftar menu
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menampilkan daftar menu
                ...transaksi['menu'].map<Widget>((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0), // Mengurangi jarak di setiap item menu
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item['namaMenu']}',
                          style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${item['harga']} x ${item['jumlah']}',
                              style: TextStyle(fontSize: 12), // Ukuran font lebih kecil
                            ),
                            Text(
                              'Rp${item['harga'] * item['jumlah']}',
                              style: TextStyle(fontSize: 12), // Ukuran font lebih kecil
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
                Divider(color: Colors.black), // Garis hitam di bawah daftar menu
                SizedBox(height: 8), // Mengurangi jarak antara garis dan total
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
                // Kondisi jika transaksi "Belum Lunas", tidak tampilkan Tunai dan Kembalian
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
                Navigator.of(context).pop();
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
      automaticallyImplyLeading: false, // Menghilangkan ikon panah hitam
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon panah berwarna putih
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
          SizedBox(width: 8), // Jarak antara ikon dan judul
          Text(
            'Daftar Transaksi', 
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF8B0000),
    ),
    
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: transaksiList.asMap().entries.map((entry) {
            int index = entry.key;
            var transaksi = entry.value;

            // Menentukan warna berdasarkan status
            Color statusColor = transaksi['status'] == 'Lunas' ? Colors.green : Colors.red;

            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${index + 1}. ${transaksi['namaPelanggan']}',
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black), // Hitam
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '-',
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black), // Tanda penghubung hitam
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${transaksi['status']}',
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: statusColor), // Warna sesuai status
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text('Tanggal : ${transaksi['tanggal']}', style: TextStyle(fontSize: 14)),
                              SizedBox(height: 2),
                              Text('Nomor Meja : ${transaksi['nomorMeja']}', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        _showDetails(context, transaksi);
                      },
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}

}
