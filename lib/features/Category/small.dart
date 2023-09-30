import 'package:flutter/material.dart';
import 'package:e_revive_app/features/Map/map_screen.dart';

class Small extends StatelessWidget {
  static const String routeName = '/small';
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Small Electronics '),
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
    'Smart Watches',
    'Cables',
    'Chargers',
    'Remote Controls',
  ];

  final List<List<String>> data = [
    ['Gold', '20-30%', '0-5%', '0-5%', '0-5%',],
    ['Silver', '10-20%', '0-5%', '0-5%', '0-5%',],
    ['Copper', '20-30%', '50-75%', '50-75%', '50-60%',],
    ['Lead',  '10-20%', '0-5%', '0-5%', '0-5%',],
    ['Mercury', '5-15%', '0-5%', '10-20%', '0-5%'],
    ['Cadmium', '5-15%', '0-5%', '15-25%', '0-5%', ],
    ['Bromine', '5-15%', '0-5%', '5-15%', '0-5%', ],
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