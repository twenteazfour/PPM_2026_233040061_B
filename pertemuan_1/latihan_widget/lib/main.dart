import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LatihanLengkapPage(),
    );
  }
}

class LatihanLengkapPage extends StatelessWidget {
  const LatihanLengkapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Flutter Ellen'),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Hello Flutter!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.deepPurple,
                letterSpacing: 2,
              ),
            ),
            const Text(
              'Ini teks biasa dengan ukuran kecil',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Divider(height: 50),
            Container(
              width: 300,
              height: 100,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.3),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Center(
                child: Text('Box', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            const Divider(height: 50),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Latihan Row: SpaceEvenly', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.green),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
            const Divider(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite, size: 64, color: Colors.red),
                Icon(Icons.notifications, size: 48, color: Colors.green),
                Icon(Icons.settings, size: 24, color: Colors.purple),
                Icon(Icons.person, size: 32, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}