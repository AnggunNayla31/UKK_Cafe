import 'package:flutter/material.dart';

class NotaPage extends StatelessWidget {
  final String date;
  final String tableNumber;
  final String customerName;
  final String cashierName;
  final List<MenuItem> menuItems;
  final double totalCash;
  final double totalChange;

  NotaPage({
    required this.date,
    required this.tableNumber,
    required this.customerName,
    required this.cashierName,
    required this.menuItems,
    required this.totalCash,
    required this.totalChange,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = menuItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nota Pembayaran'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'WIKUSAMA CAFE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text('Jl. Danau Ranau, Sawojajar, Kec. Kedungkandang, Kota Malang'),
            ),
            SizedBox(height: 20),
            Text('Tanggal: $date'),
            Text('Nomor Meja: $tableNumber'),
            Text('Nama Pelanggan: $customerName'),
            Text('Kasir: $cashierName'),
            SizedBox(height: 20),
            Text('Menu:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...menuItems.map((item) => Text('${item.name} - ${item.price.toStringAsFixed(2)}')),
            Divider(),
            Text('Total: ${totalPrice.toStringAsFixed(2)}'),
            Text('Tunai: ${totalCash.toStringAsFixed(2)}'),
            Text('Kembali: ${totalChange.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final double price;

  MenuItem(this.name, this.price);
}
