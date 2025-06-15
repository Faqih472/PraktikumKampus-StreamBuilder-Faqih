📚 Flutter State Management dengan StreamsBuilder Repositori ini berisi tugas-tugas praktikum Pemrograman Streams pada Flutter, berdasarkan materi perkuliahan Aplikasi Mobile Lanjutan.

🚀 Getting Started Proyek ini merupakan titik awal untuk memahami konsep StreamBBuilder programming dalam Flutter. Setiap soal berisi penjelasan, cuplikan kode, serta hasil output berupa screenshot atau GIF.

📝 Daftar Soal

✅ Soal 12 
-Langkah 3 (class NumberStream), merupakan struktur stream yang menghasilkan angka acak dari 0 hingga 9 secara terus-menerus, dengan interval setiap 1 detik. Stream ini menggunakan Stream.periodic untuk menghasilkan data secara periodik dan yield* untuk meneruskan seluruh hasilnya ke stream utama.

-Langkah 7 (StreamBuilder atau listen) merupakan penutup dari blok yang membangun UI. Ketika menggunakan StreamBuilder, maka UI akan secara otomatis membangun ulang (rebuild) setiap kali data baru diterima dari stream. Artinya, setiap kali ada perubahan data dari stream, UI akan langsung ikut berubah atau diperbarui.
📸 Hasil:
![s12](https://github.com/user-attachments/assets/ff3c4112-3c4a-4498-a24f-e180ca7fc515)


✅ Soal 13

Konsep BLoC terletak pada interaksi 3 komponen:

Events (Peristiwa): Aksi dari pengguna (misalnya, menekan tombol FloatingActionButton) yang mengirimkan sinyal ke BLoC melalui Sink (_bloc.generateRandom.add(null)).

BLoC (Business Logic Component): Diimplementasikan dalam RandomNumberBloc. BLoC bertanggung jawab untuk:

Menerima Events.

Menjalankan logika bisnis (menghasilkan angka acak).

Mengeluarkan State (angka acak yang baru) melalui Stream (randomNumber).

Mengelola StreamController (_generateRandomController untuk input event, _randomNumberController untuk output state) dan membersihkannya (dispose()).

State (Keadaan): Data terbaru (angka acak) yang dihasilkan oleh BLoC. UI (RandomScreen) "mendengarkan" State ini menggunakan StreamBuilder (stream: _bloc.randomNumber) untuk secara otomatis memperbarui tampilan ketika ada perubahan State.

Singkatnya:

BLoC (RandomNumberBloc) bertindak sebagai jembatan. UI mengirimkan Event ke BLoC (lewat Sink), BLoC memprosesnya dan menghasilkan State baru, lalu State ini dialirkan kembali ke UI (lewat Stream) agar UI dapat diperbarui secara reaktif tanpa campur tangan langsung. Ini membuat kode lebih terstruktur, mudah diuji, dan dipelihara.

📸 Hasil:
![s13](https://github.com/user-attachments/assets/545530a5-c926-42ef-bc11-d8f0643621b8)
