import 'dart:convert';
import 'dart:developer';
import 'package:date_time_approach/provider/shipment_provider.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

import '../core/model/excel_data.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final shipment = ShipmentProvider.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  ByteData data =
                      await rootBundle.load("assets/merchants.xlsx");
                  var bytes = data.buffer
                      .asUint8List(data.offsetInBytes, data.lengthInBytes);
                  var excel = Excel.decodeBytes(bytes);
                  List<Map<String, dynamic>> l =
                      await convertExcelToJson(excel);
                  List<ExcelData> list = l
                      .map((e) => ExcelData.fromJson(json.decode(e.toString())))
                      .toList();
                  await shipment.addBulkShipment(
                      uploadedShipments: list.take(100).toList());
                },
                child: const Text('Create Excel File')),
            TextButton(onPressed: () {}, child: const Text('Get Excel File')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult r = await FilePicker.platform.pickFiles();
          if (r != null) {
            await OpenFile.open(r.files[0].path);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> convertExcelToJson(Excel excel) async {
    int i = 0;
    List<dynamic> keys = <dynamic>[];
    List<Map<String, dynamic>> json = <Map<String, dynamic>>[];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        if (i == 0) {
          keys = row;
          i++;
        } else {
          Map<String, dynamic> temp = <String, dynamic>{};
          int j = 0;
          String tk = '';
          for (var key in keys) {
            tk = '"' + key + '"';
            temp[tk] = (row[j].runtimeType == String)
                ? '"' + row[j].toString() + '"'
                : row[j];
            j++;
          }
          json.add(temp);
        }
      }
    }
    return json;
  }
}
