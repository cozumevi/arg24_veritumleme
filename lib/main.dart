// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:arg24_veritumleme/data_view.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/src/media_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern MDM Veri Yönetimi',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF00796B),
          secondary: Color(0xFF8E8E93),
          surface: Color(0xFFF5F5F5),
          background: Color(0xFFECEFF1),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Poppins', color: Color(0xFF212121)),
          bodyMedium:
              TextStyle(fontFamily: 'Poppins', color: Color(0xFF212121)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF00796B),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      home: const MaterialListScreen(),
    );
  }
}

class MaterialListScreen extends StatefulWidget {
  const MaterialListScreen({super.key});

  @override
  _MaterialListScreenState createState() => _MaterialListScreenState();
}

class _MaterialListScreenState extends State<MaterialListScreen> {
  String? filePath1;
  String? filePath2;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MDM Veri Yönetimi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(this.context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildUploadButton("Excel Dosyasını Yükle 1", 1),
            const SizedBox(height: 20),
            filePath1 != null
                ? _buildSelectedFile(filePath1!)
                : _buildEmptyFileIndicator("Henüz dosya 1 seçilmedi."),
            const SizedBox(height: 20),
            _buildUploadButton("Excel Dosyasını Yükle 2", 2),
            const SizedBox(height: 20),
            filePath2 != null
                ? _buildSelectedFile(filePath2!)
                : _buildEmptyFileIndicator("Henüz dosya 2 seçilmedi."),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text("Verileri Yükle ve İşle"),
              onPressed: mergeFiles,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color(0xFF00796B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(String text, int fileNumber) {
    return ElevatedButton.icon(
      icon: Icon(Icons.file_upload,
          color: Theme.of(this.context).colorScheme.onPrimary),
      label: Text(text,
          style:
              TextStyle(color: Theme.of(this.context).colorScheme.onPrimary)),
      onPressed: () => pickFile(fileNumber),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Theme.of(this.context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSelectedFile(String fileName) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: const Icon(Icons.file_present, color: Colors.blueGrey),
        title: Text(
          fileName.split('/').last,
          style: const TextStyle(fontSize: 16, color: Color(0xFF212121)),
        ),
      ),
    );
  }

  Widget _buildEmptyFileIndicator(String message) {
    return Text(
      message,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Future<void> pickFile(int fileNumber) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        setState(() {
          if (fileNumber == 1) {
            filePath1 = result.files.single.path;
          } else {
            filePath2 = result.files.single.path;
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(content: Text('Dosya seçimi başarısız: $e')),
      );
    }
  }

  Future<void> mergeFiles() async {
    /*if (filePath1 == null || filePath2 == null) {
      ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(
        content: Text("Lütfen her iki dosyayı da yükleyin."),
      ));
      return;
    }*/

    setState(() {
      isLoading = true;
    });

    //showLoadingPopup(this.context);

    // API'yi çağırmak için URL'yi belirtin
    String apiUrl = "http://20.20.0.32:8000/merge_files/";

    // İlk dosya
    File file1 = File(filePath1!);

    // İkinci dosya
    File file2 = File(filePath2!);

    // Multipart request oluşturuyoruz
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    // İlk dosyayı ekliyoruz
    request.files.add(
      await http.MultipartFile.fromPath(
          'file1', // Sunucuda kullanılacak anahtar adı
          file1.path,
          filename: basename(file1.path), // Dosya adı,
          contentType: MediaType.parse(
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")),
    );

    // İkinci dosyayı ekliyoruz
    request.files.add(
      await http.MultipartFile.fromPath(
          'file2', // Sunucuda kullanılacak anahtar adı
          file2.path,
          filename: basename(file2.path), // Dosya adı
          contentType: MediaType.parse(
              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")),
    );

    // İsteği gönderiyoruz ve yanıtı alıyoruz
    try {
      var response = await request.send();

      // Yanıtı işleme
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var data = jsonDecode(responseData);

        List<dynamic> mergedData = jsonDecode(data['merged_data']);

        var columns = mergedData[0]
            .keys
            .toList()
            .map(
              (str) => DataColumn(
                  label: Text(str,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue))),
            )
            .toList()
            .cast<DataColumn>();

        var cells = mergedData[0]
            .values
            .toList()
            .map((str) => DataCell(Text(
                  str.toString(),
                  overflow: TextOverflow.ellipsis,
                )))
            .toList()
            .cast<DataCell>();

        Navigator.push(
          this.context,
          MaterialPageRoute(
            builder: (context) => DataView(
              columns: columns,
              mergedData: mergedData,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
          content: Text('Veri işleme hatası: ${response.statusCode}'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        content: Text('API isteği başarısız: $e'),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showLoadingPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Veriler işleniyor, lütfen bekleyin..."),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(this.context).pop();
    });
  }
}


/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern MDM Veri Yönetimi',
      theme: ThemeData(
        // SAP Fiori tarzında açık pastel tonlar kullanıyoruz
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF00796B), // SAP Fiori'de sıkça kullanılan yeşil ton
          secondary: Color(0xFF8E8E93), // SAP Fiori'deki gri tonlar
          surface: Color(0xFFF5F5F5), // Arka planlar için açık gri tonlar
          background: Color(0xFFECEFF1), // SAP Fiori'nin genel arka plan tonu
          onPrimary: Colors.white, // Ana butonlar üzerindeki yazı rengi
          onSecondary: Colors.black, // Sekonder butonlar üzerindeki yazı rengi
        ),
        useMaterial3: true, // Material 3'ü aktif ediyoruz.
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF212121)), // SAP Fiori'nin yazı rengi
          bodyMedium: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF212121)), // Yazı rengi koyu gri
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF00796B), // Buton üzerindeki yazı rengi
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8), // SAP Fiori'de hafif yuvarlatılmış köşeler
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      home: MaterialListScreen(),
    );
  }
}

class MaterialListScreen extends StatefulWidget {
  const MaterialListScreen({super.key});

  @override
  _MaterialListScreenState createState() => _MaterialListScreenState();
}

class _MaterialListScreenState extends State<MaterialListScreen> {
  String? filePath1;
  String? filePath2;
  Uint8List? fileBytes1;
  Uint8List? fileBytes2;
  bool isLoading = false;
  List<dynamic> mergedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MDM Veri Yönetimi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Başlık beyaz olacak
          ),
        ),
        backgroundColor: Theme.of(this.context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildUploadButton("Excel Dosyasını Yükle 1", 1),
            const SizedBox(height: 20),
            filePath1 != null
                ? _buildSelectedFile(filePath1!)
                : _buildEmptyFileIndicator("Henüz dosya 1 seçilmedi."),
            const SizedBox(height: 20),
            _buildUploadButton("Excel Dosyasını Yükle 2", 2),
            const SizedBox(height: 20),
            filePath2 != null
                ? _buildSelectedFile(filePath2!)
                : _buildEmptyFileIndicator("Henüz dosya 2 seçilmedi."),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text("Verileri Yükle ve İşle"),
              onPressed: mergeFiles,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Color(0xFF00796B), // SAP Fiori ana vurgu rengi
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20), // İşlem sırasında progress göstergesi
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(String text, int fileNumber) {
    return ElevatedButton.icon(
      icon: Icon(Icons.file_upload,
          color: Theme.of(this.context).colorScheme.onPrimary),
      label: Text(text,
          style: TextStyle(color: Theme.of(this.context).colorScheme.onPrimary)),
      onPressed: () => pickFile(fileNumber),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Theme.of(this.context)
            .colorScheme
            .secondary, // Buton arka planı gri olacak
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8), // SAP Fiori tarzı yuvarlatılmış köşeler
        ),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSelectedFile(String fileName) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: const Icon(Icons.file_present, color: Colors.blueGrey),
        title: Text(
          fileName.split('/').last,
          style: const TextStyle(fontSize: 16, color: Color(0xFF212121)),
        ),
      ),
    );
  }

  Widget _buildEmptyFileIndicator(String message) {
    return Text(
      message,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Future<void> pickFile(int fileNumber) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        if (kIsWeb) {
          Uint8List? fileBytes = result.files.single.bytes;

          if (fileBytes != null) {
            setState(() {
              if (fileNumber == 1) {
                fileBytes1 = fileBytes;
                filePath1 = result.files.single.name;
              } else {
                fileBytes2 = fileBytes;
                filePath2 = result.files.single.name;
              }
            });
          }
        } else {
          setState(() {
            if (fileNumber == 1) {
              filePath1 = result.files.single.path;
            } else {
              filePath2 = result.files.single.path;
            }
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(content: Text('Dosya seçimi başarısız: $e')),
      );
    }
  }

  Future<void> mergeFiles() async {
    if (filePath1 == null || filePath2 == null) {
      ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(
        content: Text("Lütfen her iki dosyayı da yükleyin."),
      ));
      return;
    }

    setState(() {
      isLoading = true;
    });

    showLoadingPopup(this.context);

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (this.context) => DataView(),
      ),
    );
  }

  void showLoadingPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Veriler işleniyor, lütfen bekleyin..."),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(this.context).pop();
    });
  }
} */