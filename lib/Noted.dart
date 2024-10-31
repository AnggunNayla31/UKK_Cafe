import 'package:flutter/material.dart';
import 'package:kasir_cafe/Login_page2.dart';

class NotaPage extends StatelessWidget {
  final String date;
  final String customerName;
  final List menuItems;
  final String tableNumber; // Tambahkan parameter untuk nomor meja
  final String cashierName; // Tambahkan parameter untuk nama kasir

  NotaPage({
    required this.date,
    required this.customerName,
    required this.menuItems,
    required this.tableNumber, // Terima parameter nomor meja
    required this.cashierName,  // Terima parameter nama kasir
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = menuItems.fold(0, (sum, item) => sum + (item["price"] * item["quantity"]));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Jarak atas untuk menggeser konten ke bawah
            Center(
              child: Text(
                'WIKUSAMA CAFE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Jl. Danau Ranau, Sawojajar, Kec. Kedungkandang, Kota Malang',
              ),
            ),
            SizedBox(height: 20), // Jarak setelah alamat
            Container(
              height: 2, // Atur tinggi garis
              color: Colors.black, // Atur warna garis
              margin: const EdgeInsets.symmetric(vertical: 10), // Jarak vertikal
            ),
            SizedBox(height: 20), // Jarak sebelum tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal :'),
                Text(date), // Tanggal di sebelah kanan
              ],
            ),
            SizedBox(height: 10), // Jarak setelah tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nama Pelanggan :'),
                Text(customerName), // Nama pelanggan di sebelah kanan
              ],
            ),
            SizedBox(height: 10), // Jarak setelah nama pelanggan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nomor Meja :'),
                Text(tableNumber), // Nomor meja di sebelah kanan
              ],
            ),
            SizedBox(height: 10), // Jarak setelah nomor meja
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kasir :'),
                Text(cashierName), // Nama kasir di sebelah kanan
              ],
            ),
            Container(
              height: 2, // Atur tinggi garis
              color: Colors.black, // Atur warna garis
              margin: const EdgeInsets.symmetric(vertical: 10), // Jarak vertikal
            ),
            SizedBox(height: 10), // Jarak sebelum menu

            // Menampilkan menu yang dipilih dan harganya
            ...menuItems.where((item) => item["quantity"] > 0).map((item) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${item[""]} ${item["quantity"]} x'),
                Text('Rp. ${item["price"].toStringAsFixed(2)}'), // Harga di sebelah kanan
              ],
            )).toList(),

            SizedBox(height: 10), // Jarak setelah daftar menu
            
            // Garis pemisah untuk total
            Container(
              height: 2,
              color: Colors.black,
              margin: const EdgeInsets.symmetric(vertical: 10), // Jarak vertikal
            ),
            SizedBox(height: 10), // Jarak sebelum total
            
            // Menampilkan total harga di sebelah kanan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:'),
                Text('${totalPrice.toStringAsFixed(2)}'), // Total harga di sebelah kanan
              ],
            ),

            Spacer(), // Menambahkan ruang kosong agar tombol berada di bawah
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // Jarak dari sisi kiri
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman login dan menghapus semua halaman sebelumnya
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page2()), // Ganti dengan halaman login Anda
                    (route) => false, // Menghapus semua rute sebelumnya
                  );
                },
                child: Text(
                  'Exit',
                  style: TextStyle(color: Colors.white), // Atur warna teks tombol menjadi putih
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B0000), // Atur warna latar belakang tombol
                ),
              ),
            ),
            SizedBox(height: 20), // Jarak sebelum batas bawah
          ],
        ),
      ),
    );
  }
}
