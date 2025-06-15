import 'package:flutter/material.dart';
import 'package:streambuilderfaqih/random_bloc.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  // Membuat instance BLoC.
  // Pastikan BLoC diinisialisasi sekali dan di-dispose saat widget tidak lagi digunakan.
  final _bloc = RandomNumberBloc();

  @override
  void dispose() {
    // Memanggil metode dispose BLoC saat State widget di-dispose
    // Ini penting untuk membersihkan StreamController
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number BLoC'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        // StreamBuilder mendengarkan stream dari BLoC (_bloc.randomNumber)
        // dan membangun ulang UI setiap kali ada data baru (angka acak)
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber, // Stream yang akan didengarkan
          initialData: 0, // Data awal yang ditampilkan sebelum stream memancarkan data
          builder: (context, snapshot) {
            // Menampilkan angka acak dari snapshot
            return Text(
              'Random Number: ${snapshot.data}', // Menampilkan data terbaru
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      // FloatingActionButton untuk memicu event "generate random number"
      floatingActionButton: FloatingActionButton( // Corrected typo here
        onPressed: () => _bloc.generateRandom.add(null), // Mengirim event ke BLoC
        child: const Icon(Icons.refresh), // Icon refresh
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}