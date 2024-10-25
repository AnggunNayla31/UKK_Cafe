import 'package:flutter/material.dart';

class Noted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nota Pesanan'),
        backgroundColor: Color(0xFF8B0000),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pesanan Berhasil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Terima kasih atas pesanan Anda!'),
          ],
        ),
      ),
    );
  }
}

