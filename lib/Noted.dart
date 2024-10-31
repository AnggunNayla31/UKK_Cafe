import 'package:flutter/material.dart';

class NotaPage extends StatelessWidget {
  final String date;
  final String customerName;
  final List menuItems;
  final String tableNumber; // Menambahkan Nomor Meja
  final String cashierName; // Menambahkan Nama Kasir

  NotaPage({
    required this.date,
    required this.customerName,
    required this.menuItems,
    required this.tableNumber,
    required this.cashierName,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = menuItems.fold(0, (sum, item) => sum + item["price"]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50), // Memberi jarak vertikal lebih ke bawah

            // Informasi Cafe di Tengah
            Center(
              child: Column(
                children: [
                  Text(
                    'WIKUSAMA CAFE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8), // Jarak antara nama cafe dan alamat
                  Text(
                    'Jl. Danau Ranau, Sawojajar, Kec. Kedungkandang, Kota Malang',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8), // Jarak antara alamat dan garis
                  Divider(thickness: 2, color: Colors.black), // Garis pembatas
                ],
              ),
            ),
            SizedBox(height: 20), // Jarak antara informasi cafe dan konten nota

            // Informasi Tanggal, Nomor Meja, Nama Pelanggan, dan Kasir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Ukuran font ditambahkan
                Text(date, style: TextStyle(fontSize: 18)), // Ukuran font ditambahkan
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nomor Meja:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Ukuran font ditambahkan
                Text(tableNumber, style: TextStyle(fontSize: 18)), // Ukuran font ditambahkan
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nama Pelanggan:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Ukuran font ditambahkan
                Text(customerName, style: TextStyle(fontSize: 18)), // Ukuran font ditambahkan
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kasir:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Ukuran font ditambahkan
                Text(cashierName, style: TextStyle(fontSize: 18)), // Ukuran font ditambahkan
              ],
            ),
            SizedBox(height: 8),
            Divider(thickness: 2, color: Colors.black), // Garis tebal di bawah informasi kasir
            SizedBox(height: 20), // Jarak antara informasi dan daftar menu

            // Daftar Menu
            Text('Menu:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...menuItems.map((item) => Text('${item["name"]} - Rp ${item["price"].toStringAsFixed(2)}')),
            Divider(),
            Text(
              'Total: Rp ${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
