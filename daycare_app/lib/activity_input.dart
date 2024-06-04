import 'package:flutter/material.dart';

class ToiletEntry {
  TextEditingController timeController = TextEditingController();
  String type = 'Diaper';
  String condition = 'DR';
  TextEditingController notesController = TextEditingController();
}

class BottleEntry {
  TextEditingController timeController = TextEditingController();
  TextEditingController mlController = TextEditingController();
  String type = 'Breast';
}

class ActivityInputScreen extends StatefulWidget {
  final String childName; // Menambahkan parameter childName

  ActivityInputScreen({required this.childName});

  @override
  _ActivityInputScreenState createState() => _ActivityInputScreenState();
}

class _ActivityInputScreenState extends State<ActivityInputScreen> {
  final TextEditingController _namaAnakController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();
  final TextEditingController _bodyTemperatureController = TextEditingController();
  final TextEditingController _conditionsController = TextEditingController();

  // Meal controllers
  final List<TextEditingController> _mealFoodControllers = List.generate(6, (index) => TextEditingController());
  final List<TextEditingController> _mealCommentControllers = List.generate(6, (index) => TextEditingController());
  final List<String> _mealQuantities = List.generate(6, (index) => 'None');

  List<ToiletEntry> _toiletEntries = [];
  List<BottleEntry> _bottleEntries = [];

  final TextEditingController _otherController = TextEditingController();

  final Map<String, bool> _itemNeeds = {
    'Diapers': false,
    'Hand towel': false,
    'Cream': false,
    'Clothes': false,
    'Towel': false,
    'Soap & Shampoo': false,
    'Milk': false,
    'Tooth Paste': false,
    'Other': false,
  };
  final TextEditingController _otherItemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaAnakController.text = widget.childName; // Mengisi nama anak dari parameter
  }

  void _submitActivity(BuildContext context) {
    // Logic to save child activity data
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Child activity data saved successfully')),
    );
  }

  void _addNewToiletEntry() {
    setState(() {
      _toiletEntries.add(ToiletEntry());
    });
  }

  void _addNewBottleEntry() {
    setState(() {
      _bottleEntries.add(BottleEntry());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Child Activity for ${widget.childName}'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildSectionTitle('Child Activity Information:'),
              _buildTextField(_namaAnakController, 'Child Name', Icons.child_care),
              _buildTextField(_tanggalController, 'Date', Icons.calendar_today),
              _buildTextField(_arrivalController, 'Arrival Time', Icons.access_time),
              _buildTextField(_bodyTemperatureController, 'Body Temperature', Icons.thermostat),
              _buildTextField(_conditionsController, 'Conditions', Icons.health_and_safety),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              _buildSectionTitle('Meals:'),
              _buildMealSection('Breakfast', 0),
              _buildMealSection('Snack', 1),
              _buildMealSection('Lunch', 2),
              _buildMealSection('Dinner', 3),
              _buildMealSection('Fluids', 4),
              _buildMealSection('Other', 5),
              Divider(color: Colors.grey),
              _buildSectionTitle('Toilet:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < _toiletEntries.length; i++)
                    _buildToiletEntry(i),
                  ElevatedButton(
                    onPressed: _addNewToiletEntry,
                    child: Text('Add Toilet Entry'),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              _buildSectionTitle('Bottle:'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < _bottleEntries.length; i++)
                    _buildBottleEntry(i),
                  ElevatedButton(
                    onPressed: _addNewBottleEntry,
                    child: Text('Add Bottle Entry'),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              _buildSectionTitle('Other:'),
              _buildTextField(_otherController, 'Other', Icons.notes),
              Divider(color: Colors.grey),
              _buildSectionTitle('ITEM I NEED:'),
              Column(
                children: _itemNeeds.keys.map((String key) {
                  if (key == 'Other') {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text(key),
                              value: _itemNeeds[key],
                              onChanged: (bool? value) {
                                setState(() {
                                  _itemNeeds[key] = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: _itemNeeds[key]! ? _buildTextField(_otherItemController, 'Specify Other', Icons.notes) : Container(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return CheckboxListTile(
                      title: Text(key),
                      value: _itemNeeds[key],
                      onChanged: (bool? value) {
                        setState(() {
                          _itemNeeds[key] = value!;
                        });
                      },
                    );
                  }
                }).toList(),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _submitActivity(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.orange,
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
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

  Widget _buildDropdownField(String label, IconData icon, List<String> options, String currentValue, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: currentValue,
            isDense: true,
            onChanged: onChanged,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildMealSection(String mealType, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            mealType,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        _buildTextField(_mealFoodControllers[index], 'Food', Icons.restaurant_menu),
        _buildDropdownField(
          'Quantity',
          Icons.restaurant,
          ['None', 'Some', 'Lots'],
          _mealQuantities[index],
              (newValue) {
            setState(() {
              _mealQuantities[index] = newValue!;
            });
          },
        ),
        _buildTextField(_mealCommentControllers[index], 'Comment', Icons.comment),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildToiletEntry(int index) {
    final ToiletEntry toiletEntry = _toiletEntries[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            'Toilet Entry ${index + 1}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        _buildTextField(toiletEntry.timeController, 'Time', Icons.access_time),
        _buildDropdownField(
          'Type',
          Icons.wc,
          ['Diaper', 'Potty'],
          toiletEntry.type,
              (newValue) {
            setState(() {
              toiletEntry.type = newValue!;
            });
          },
        ),
        _buildDropdownField(
          'Condition',
          Icons.wc,
          ['DR', 'Wet', 'BM'],
          toiletEntry.condition,
              (newValue) {
            setState(() {
              toiletEntry.condition = newValue!;
            });
          },
        ),
        _buildTextField(toiletEntry.notesController, 'Notes', Icons.notes),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildBottleEntry(int index) {
    final BottleEntry bottleEntry = _bottleEntries[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            'Bottle Entry ${index + 1}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        _buildTextField(bottleEntry.timeController, 'Time', Icons.access_time),
        _buildTextField(bottleEntry.mlController, 'ML', Icons.local_drink),
        _buildDropdownField(
          'Type',
          Icons.local_drink,
          ['Breast', 'Formula'],
          bottleEntry.type,
              (newValue) {
            setState(() {
              bottleEntry.type = newValue!;
            });
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
