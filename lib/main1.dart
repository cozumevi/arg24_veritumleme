
/* void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  Uint8List? fileBytes1;
  Uint8List? fileBytes2;
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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
          color: Theme.of(context).colorScheme.onPrimary),
      label: Text(text,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
      onPressed: () => pickFile(fileNumber),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dosya seçimi başarısız: $e')),
      );
    }
  }

  /* Future<void> mergeFiles() async {
    if (filePath1 == null || filePath2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Lütfen her iki dosyayı da yükleyin."),
      ));
      return;
    }

    setState(() {
      isLoading = true;
    });

    showLoadingPopup(context);

    try {
      // API'yi çağırmak için URL'yi belirtin
      String apiUrl = "http://127.0.0.1:8000/merge_files/";

      Map<String, String> queryParams = {
         'file1_name': filePath1!,  // Mutlaka tam dosya yolu olmalı
         'file2_name': filePath2!,  // Mutlaka tam dosya yolu olmalı
};

      Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var mergedData = data['merged_data'];
        var columnMatches = data['column_matches'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataView(
              mergedData: mergedData,
              columnMatches: columnMatches,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Veri işleme hatası: ${response.statusCode}'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('API isteği başarısız: $e'),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  } */

  Future<void> mergeFiles() async {
    if (filePath1 == null || filePath2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Lütfen her iki dosyayı da yükleyin."),
      ));
      return;
    }

    // İşlem başladığında print et
    print("Veri işleme başladı...");
    setState(() {
      isLoading = true;
    });

    showLoadingPopup(context);

    try {
      // API URL'sini ekrana yazdır
      String apiUrl = "http://20.20.0.32:8000/merge_files/";
      print("API URL: $apiUrl");

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      // Dosya yollarını print ile göster
      print("File 1 Path: $filePath1");
      print("File 2 Path: $filePath2");

      // Dosya yollarını ekliyoruz
      request.files.add(await http.MultipartFile.fromPath('file1', filePath1!));
      request.files.add(await http.MultipartFile.fromPath('file2', filePath2!));

      // API isteğini yapmadan önce bilgi ver
      print("API isteği gönderiliyor...");

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // API cevabını kontrol et
      print("API isteği tamamlandı, Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("API yanıtı başarılı, veri alındı: $data");

        var mergedData = data['merged_data'];
        var columnMatches =
            data.containsKey('column_matches') ? data['column_matches'] : [];
        print("Column matches: $columnMatches"); // Hata ayıklamak için

        // Verileri işleme sayfasına gönder
        print("Navigasyon yapılıyor...");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataView(
              mergedData: mergedData,
              columnMatches: columnMatches,
            ),
          ),
        );
      } else {
        print("API'den hata döndü: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Veri işleme hatası: ${response.statusCode}'),
        ));
      }
    } catch (e) {
      print("API isteği başarısız: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
      Navigator.of(context).pop();
    });
  }
} */
