import 'package:flutter/material.dart';

/* class DataView extends StatelessWidget {
  // Tabloya eklemek için veri listesi
  final List<Map<String, String>> data = [
  {
    'Malzeme no': '1000001',
    'Malzeme kısa metni': 'Twix (50 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000002',
    'Malzeme kısa metni': 'Mars (51 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000003',
    'Malzeme kısa metni': 'Bounty (57 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-17',
    'Değiştiren Ad-Soyad': 'BBAYRAKTAR',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000004',
    'Malzeme kısa metni': 'Snickers (50 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000005',
    'Malzeme kısa metni': 'Eti Canga (45 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000006',
    'Malzeme kısa metni': 'Ülker Piko Pirinç Patlaklı Bar 18g',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000007',
    'Malzeme kısa metni': 'Ülker Metro (36 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    "Malzeme no": "1000008",
    "Malzeme kısa metni": "Ülker Albeni (40 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000009",
    "Malzeme kısa metni": "Tadelle Beyaz Çikolatalı Bar 30g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000010",
    "Malzeme kısa metni": "Ülker Caramio Karamel Baton Çikolata 32g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000011",
    "Malzeme kısa metni": "Eti Canga Gold (45 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000012",
    "Malzeme kısa metni": "Milka Oreo Bar (37 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000013",
    "Malzeme kısa metni": "Eti Wanted Bumba Hindistan Ceviz Bar 32g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000014",
    "Malzeme kısa metni": "Ülker Mini All Star Çikolata Paketi 91g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    'Malzeme no': '1000015',
    'Malzeme kısa metni': 'Milka Lila Pause (34 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-11',
    'Değiştiren Ad-Soyad': 'BBAYRAKTAR',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000016',
    'Malzeme kısa metni': 'Ülker Laviva Limonlu Cheesecake Bar 35g',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000017',
    'Malzeme kısa metni': 'Ülker Albeni Eğlenceli AI Tasarımı 40g',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000018',
    'Malzeme kısa metni': 'Boombastic Fındık Sütlü Çikolata Bar 40g',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000019',
    'Malzeme kısa metni': 'Ülker Caramio Duo Karamelli Çikolata 32g',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    'Malzeme no': '1000020',
    'Malzeme kısa metni': 'Ülker Metro Big 3 (45 g)',
    'Yaratan': 'XISELIM',
    'Yaratma tarihi': '2023-10-23',
    'Son değişiklik': '2024-07-02',
    'Değiştiren Ad-Soyad': 'XSMAALEL',
    'Bakım durumu': 'KDELBSVPQG',
    'Malzeme türü': 'Z001',
    'Sektör': '1',
  },
  {
    "Malzeme no": "1000021",
    "Malzeme kısa metni": "Milka Oreo Bar (37 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000022",
    "Malzeme kısa metni": "Eti Canga Gold (45 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000023",
    "Malzeme kısa metni": "Eti Canga (45 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000024",
    "Malzeme kısa metni": "Ülker Piko Pirinç Patlaklı Bar 18g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000025",
    "Malzeme kısa metni": "Milka Lila Pause (34 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000026",
    "Malzeme kısa metni": "Boombastic Fındık Sütlü Çikolata Bar 40g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000027",
    "Malzeme kısa metni": "Ülker Albeni Eğlenceli AI Tasarımı 40g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000028",
    "Malzeme kısa metni": "Ülker Caramio Karamel Baton Çikolata 32g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000029",
    "Malzeme kısa metni": "Ülker Mini All Star Çikolata Paketi 91g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000030",
    "Malzeme kısa metni": "Milka Lila Pause (34 g)",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000031",
    "Malzeme kısa metni": "Eti Wanted Bumba Hindistan Ceviz Bar 32g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000032",
    "Malzeme kısa metni": "Ülker Albeni Çikolata 45g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000033",
    "Malzeme kısa metni": "Tadelle Çikolata 50g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
  {
    "Malzeme no": "1000034",
    "Malzeme kısa metni": "Çikolata Bar 40g",
    "Yaratan": "XISELIM",
    "Yaratma tarihi": "2023-10-23",
    "Son değişiklik": "2024-07-02",
    "Değiştiren Ad-Soyad": "XSMAALEL",
    "Bakım durumu": "KDELBSVPQG",
    "Malzeme türü": "Z001",
    "Sektör": "1"
  },
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İşlenmiş Veri Tablosu'),
      ),
      body: LayoutBuilder(
        builder:
            (BuildContext context, BoxConstraints viewportConstraints) { return Center(
              child: SingleChildScrollView(
child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
        child: DataTable(
          headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.blueGrey[50]),
          columns: [
              DataColumn(label: Text('Malzeme no', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Malzeme kısa metni', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Yaratan', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Yaratma tarihi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Son değişiklik', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Değiştiren Ad-Soyad', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Bakım durumu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Malzeme türü', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
              DataColumn(label: Text('Sektör', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
          ],
          rows: data.map((item) {
              // Hatalı satırları işaretlemek için belirli koşula göre renklendirme
              bool isErrorRow = item['Malzeme no'] == '1000018' || item['Malzeme no'] == '1000004' || item['Malzeme no'] == '1000019'; // Hatalı satırlar

              return DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (isErrorRow) {
                      return Colors.red.withOpacity(0.2); // Hatalı satırın arka planı kırmızı
                    }
                    return Colors.grey[50]; // Diğer satırlar için normal arka plan
                  },
                ),
                cells: [
                  DataCell(Text(item['Malzeme no'] ?? '')),
                  DataCell(Text(item['Malzeme kısa metni'] ?? '')),
                  DataCell(Text(item['Yaratan'] ?? '')),
                  DataCell(Text(item['Yaratma tarihi'] ?? '')),
                  DataCell(Text(item['Son değişiklik'] ?? '')),
                  DataCell(Text(item['Değiştiren Ad-Soyad'] ?? '')),
                  DataCell(Text(item['Bakım durumu'] ?? '')),
                  DataCell(Text(item['Malzeme türü'] ?? '')),
                  DataCell(Text(item['Sektör'] ?? '')),
                ],
              );
          }).toList(),
          // Satırların stili
          dataRowColor: MaterialStateProperty.resolveWith((states) {
              return Colors.grey[50]; // Normal satır arka plan rengi
          }),
          dataTextStyle: TextStyle(fontSize: 14, color: Colors.black87),
          headingTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
          dividerThickness: 1.0, // Satırlar arasındaki çizgi kalınlığı
        ),),
      ),
            );
      },
      )
    );
  }
} */

class DataView extends StatelessWidget {
  final List<DataColumn> columns;
  final List<dynamic> mergedData;
  //final List<dynamic> columnMatches;

  const DataView({
    Key? key,
    required this.columns,
    required this.mergedData,
    //required this.columnMatches,
  }) : super(key: key);
  // Tabloya eklemek için veri listesi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İşlenmiş Veri Tablosu'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Yatay kaydırma ekliyoruz
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Dikey kaydırma ekliyoruz
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blueGrey[50]),
                  columns: columns,
                  rows: mergedData.take(50).map((item) {
                    String malzemeNo = item['Malzeme no'].toString();

                    // Eğer "Malzeme no" belirttiğin değerlere eşitse kırmızı renk yap
                    bool isRed = ['1000004', '1000008', '1000010', '1000011']
                        .contains(malzemeNo);

                    var cells = item.values
                        .toList()
                        .map((str) => DataCell(Text(
                              str.toString(),
                              overflow: TextOverflow.ellipsis,
                            ))) // Metni taşmaması için ellipsis ekliyoruz
                        .toList()
                        .cast<DataCell>();
                    return DataRow(
                      color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (isRed) {
                            return Colors.red.withOpacity(
                                0.2); // Hatalı satırın arka planı kırmızı
                          }
                          return Colors
                              .grey[50]; // Diğer satırlar için normal arka plan
                        },
                      ),
                      cells: cells,
                    );
                  }).toList(),
                  dataRowColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.grey[50]; // Normal satır arka plan rengi
                  }),
                  dataTextStyle:
                      const TextStyle(fontSize: 14, color: Colors.black87),
                  headingTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  dividerThickness: 1.0, // Satırlar arasındaki çizgi kalınlığı
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
