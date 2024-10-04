import 'package:flutter/material.dart';
import 'dart:convert'; // JSON verisini işlemek için
// Dosya okuma işlemi için

class JsonDataTable extends StatelessWidget {
  final String jsonData; // Veriyi bu şekilde alacağız

  const JsonDataTable({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    List<dynamic> dataList;

    try {
      // JSON verisini decode edelim
      dataList = jsonDecode(jsonData);
    } catch (e) {
      return Scaffold(
        appBar: AppBar(title: const Text("Hata")),
        body: const Center(
          child: Text(
              "Veri işlenirken hata oluştu. JSON formatı geçersiz olabilir."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("İşlenmiş Veriler"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: _createColumns(dataList),
            rows: _createRows(dataList),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns(List<dynamic> data) {
    // JSON verisinden başlıkları alalım
    if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
      return (data[0] as Map<String, dynamic>)
          .keys
          .map((key) => DataColumn(label: Text(key)))
          .toList();
    } else {
      return const [];
    }
  }

  List<DataRow> _createRows(List<dynamic> data) {
    // Satırları oluşturalım
    if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
      return data.map((item) {
        final cells = (item as Map<String, dynamic>).values.map((value) {
          return DataCell(Text(value.toString()));
        }).toList();
        return DataRow(cells: cells);
      }).toList();
    } else {
      return const [];
    }
  }
}
