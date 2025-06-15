import 'dart:math';
import 'dart:async';

class RandomNumberBloc {
  // StreamController untuk input event (sinyal untuk menghasilkan angka acak)
  // Tipe <void> karena event ini tidak membawa data, hanya sebagai pemicu
  final _generateRandomController = StreamController<void>();

  // StreamController untuk output state (angka acak yang dihasilkan)
  // Tipe <int> karena akan mengeluarkan angka integer
  final _randomNumberController = StreamController<int>();

  // Input Sink: Getter untuk menambahkan event ke _generateRandomController
  // UI akan memanggil ini untuk meminta angka acak baru
  Sink<void> get generateRandom => _generateRandomController.sink;

  // Output Stream: Getter untuk stream angka acak
  // UI akan mendengarkan stream ini untuk mendapatkan angka terbaru
  Stream<int> get randomNumber => _randomNumberController.stream;

  // Constructor BLoC: Mengatur logika bisnis
  RandomNumberBloc() {
    // Mendengarkan stream dari _generateRandomController (input event)
    _generateRandomController.stream.listen((_) {
      // Ketika event diterima (misalnya, tombol ditekan),
      // logika bisnis dijalankan: menghasilkan angka acak
      final random = Random().nextInt(10); // Angka acak antara 0 dan 9

      // Angka acak yang dihasilkan ditambahkan ke sink _randomNumberController
      // Ini akan memancarkan angka sebagai state baru melalui randomNumber stream
      _randomNumberController.sink.add(random);
    });
  }

  // Method dispose: Penting untuk menutup StreamController
  // Mencegah kebocoran memori saat BLoC tidak lagi digunakan
  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
}