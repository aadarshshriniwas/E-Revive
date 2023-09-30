import 'package:flutter/material.dart';
import 'package:e_revive_app/features/Map/map_screen.dart';

class Mobile extends StatelessWidget {
  static const String routeName = '/mobile';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mobiles & Gadgets '),
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
    'Computers and monitors',
    'Mobile phones',
    'Televisions',
    'Light bulbs',
  ];

  final List<List<String>> data = [
    ['Gold', '25-35%', '20-30%', '5-15%', '0-5%'],
    ['Silver', '10-20%', '10-20%', '0-5%', '0-5%'],
    ['Copper', '20-30%', '20-30%', '15-25%', '10-20%'],
    ['Lead', '15-25%', '10-20%', '25-35%',  '0-5%'],
    ['Mercury', '5-15%', '0-5%', '10-20%', '10-20%'],
    ['Cadmium', '5-15%', '0-5%', '15-25%', '0-5%'],
    ['Bromine', '5-15%', '0-5%', '5-15%', '5-15%'],
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