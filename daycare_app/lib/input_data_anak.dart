import 'package:flutter/material.dart';
import 'laporan_activity_anak.dart';

class InputDataAnakScreen extends StatelessWidget {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _jenisKelaminController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kontakNamaController = TextEditingController();
  final TextEditingController _hubunganController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _riwayatMedisController = TextEditingController();
  final TextEditingController _jadwalKehadiranController = TextEditingController();

  void _submitData(BuildContext context) {
    // Logika untuk menyimpan data anak
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data anak berhasil disimpan')),
    );

    // Navigasi ke halaman laporan aktivitas anak
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LaporanActivityAnakScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input Data Anak',
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
              _buildSectionTitle('Informasi Pribadi Anak'),
              _buildTextField(_namaController, 'Nama lengkap', Icons.person),
              _buildTextField(_tanggalLahirController, 'Tanggal lahir', Icons.calendar_today),
              _buildTextField(_jenisKelaminController, 'Jenis kelamin', Icons.transgender),
              _buildTextField(_alamatController, 'Alamat rumah', Icons.home),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              _buildSectionTitle('Informasi Kontak Darurat'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _buildTextField(_kontakNamaController, 'Nama kontak', Icons.person),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(_hubunganController, 'Hubungan', Icons.family_restroom),
                  ),
                ],
              ),
              _buildTextField(_nomorTeleponController, 'Nomor telepon darurat', Icons.phone),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              _buildSectionTitle('Riwayat Medis'),
              _buildTextField(_riwayatMedisController, 'Riwayat medis anak', Icons.medical_services),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              _buildSectionTitle('Jadwal Kehadiran'),
              _buildTextField(_jadwalKehadiranController, 'Jadwal kehadiran anak', Icons.schedule),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _submitData(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.orange,
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InputDataAnakScreen()),
        ),
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
