import 'package:flutter/material.dart';

class LaporanActivityAnakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan Aktivitas Anak',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildInfoHeader(
                'Nama',
                'Vendyan',
                'Tanggal',
                '01 April 2024',
                'Arrival',
                '9.40',
                'Suhu Tubuh',
                '36.0°C',
                'Kondisi',
                'Baik',
              ),
              SizedBox(height: 20),
              _buildSectionTitle('Makanan'),
              _buildMealTable(),
              SizedBox(height: 20),
              _buildSectionTitle('Toilet'),
              _buildToiletTable(),
              SizedBox(height: 20),
              _buildSectionTitle('Istirahat'),
              _buildIstirahatTable(),
              SizedBox(height: 20),
              _buildSectionTitle('Botol'),
              _buildBotolTable(),
              SizedBox(height: 20),
              _buildSectionTitle('Lainnya'),
              _buildInfoRow('Mandi', 'Pagi: -, Siang: 14:08'),
              _buildInfoRow('Vitamin', '-'),
              SizedBox(height: 20),
              _buildSectionTitle('Catatan Untuk Orang Tua'),
              _buildTextInfo('Catatan', ''),
              _buildTextInfo('Barang yang Dibutuhkan', 'Clothes'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 5), // Menambahkan sedikit ruang antara judul dan tabel
      ],
    );
  }

  Widget _buildInfoHeader(
      String label1,
      String value1,
      String label2,
      String value2,
      String arrivalLabel,
      String arrivalValue,
      String label3,
      String value3,
      String label4,
      String value4,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildInfoText(label1, value1),
              _buildInfoText(label2, value2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildInfoText(arrivalLabel, arrivalValue),
              _buildInfoText(label3, value3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildInfoText(label4, value4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildMealTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('TYPE', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('FOOD', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('QUANTITY', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Sarapan')),
          DataCell(Text('-')),
          DataCell(Text('NONE')),
        ]),
        DataRow(cells: [
          DataCell(Text('Snack')),
          DataCell(Text('Buah-buahan')),
          DataCell(Text('LOTS')),
        ]),
        DataRow(cells: [
          DataCell(Text('Makan Siang')),
          DataCell(Text('Nasi, Ayam, Sayur')),
          DataCell(Text('SOME')),
        ]),
        DataRow(cells: [
          DataCell(Text('Makan Malam')),
          DataCell(Text('Nasi, Ikan, Sayur')),
          DataCell(Text('LOTS')),
        ]),
        DataRow(cells: [
          DataCell(Text('Minuman')),
          DataCell(Text('Air putih')),
          DataCell(Text('LOTS')),
        ]),
      ],
      headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.orange[100]),
      dataRowColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.orange[50] : Colors.white),
      dividerThickness: 1,
      columnSpacing: 20,
    );
  }

  Widget _buildToiletTable() {
    return DataTable(
        columns: [
        DataColumn(label: Text('Waktu', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Jenis', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(label: Text('Kondisi', style: TextStyle(fontWeight: FontWeight.bold))),
    ],
    rows: [
    DataRow(cells: [
    DataCell(Text('11:37')),
    DataCell(Text('Diaper')),
    DataCell(Text('Wet')),
    ]),
    // Add more DataRow widgets for additional entries
    ],
    headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.orange[100]),
    dataRowColor: MaterialStateProperty.resolveWith
      ((states) => states.contains(MaterialState.selected) ? Colors.orange[50] : Colors.white),
      dividerThickness: 1,
      columnSpacing: 20,
    );
  }

  Widget _buildIstirahatTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Mulai Istirahat', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Akhir Istirahat', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('12:59')),
          DataCell(Text('13:57')),
        ]),
        // Add more DataRow widgets for additional entries
      ],
      headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.orange[100]),
      dataRowColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.orange[50] : Colors.white),
      dividerThickness: 1,
      columnSpacing: 20,
    );
  }

  Widget _buildBotolTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Waktu', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('ML', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Tipe', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('09:48')),
          DataCell(Text('1 kotak')),
          DataCell(Text('Milk')),
        ]),
        // Add more DataRow widgets for additional entries
      ],
      headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.orange[100]),
      dataRowColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? Colors.orange[50] : Colors.white),
      dividerThickness: 1,
      columnSpacing: 20,
    );
  }

  Widget _buildTextInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$label: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
