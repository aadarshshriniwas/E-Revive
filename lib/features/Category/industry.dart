import 'package:flutter/material.dart';
import 'package:e_revive_app/features/Map/map_screen.dart';

class Industry extends StatelessWidget {
  static const String routeName = '/industry';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Large Appliances'),
        ),
        body: Column(
          children: [

            ChemicalDataTable(),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()),
              );
            }, child: Text("Recycle Now")),
          ],
        ),
      ),
    );
  }
}

class ChemicalDataTable extends StatelessWidget {
  final List<String> chemicals = [
    'Element',
    'Refrigerators and freezers',
    'Washing machines and dryers',
  ];

  final List<List<String>> data = [
    ['Gold','0-5%', '0-5%', ],
    ['Silver', '0-5%', '0-5%', ],
    ['Copper','10-20%', '10-20%', ],
    ['Lead','10-20%', '10-20%', ],
    ['Mercury', '0-5%', '0-5%',],
    ['Cadmium', '0-5%', '0-5%',],
    ['Bromine', '0-5%', '0-5%', ],
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: _buildColumns(),
          rows: _buildRows(),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return chemicals
        .map(
          (chemical) => DataColumn(
        label: Text(chemical),
      ),
    )
        .toList();
  }

  List<DataRow> _buildRows() {
    return data
        .map(
          (rowData) => DataRow(
        cells: rowData
            .map(
              (cellData) => DataCell(
            Text(cellData),
          ),
        )
            .toList(),
      ),
    )
        .toList();
  }
}