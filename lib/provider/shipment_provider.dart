import 'dart:convert';
import 'dart:developer';
import 'package:date_time_approach/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../core/model/excel_data.dart';
import '../core/network_state/network_state.dart';
import '../widgets/action_dialog.dart';

class ShipmentProvider with ChangeNotifier {
  static ShipmentProvider get(BuildContext context) => Provider.of<ShipmentProvider>(context);

  final String base_url = 'http://weevo.emarketingo.org';

  Future<void> addBulkShipment({
    @required List<ExcelData> uploadedShipments,
  }) async {
    uploadedShipments.forEach((i) => log('${i.amount}'));
    try {
      showDialog(
          context: navigator.currentContext,
          barrierDismissible: false,
          builder: (ctx) => Loading());
      Response r = await post(
        Uri.parse('$base_url/api/v1/merchant/shipments/bulk'),
        body: json.encode(
          {
            'shipments': uploadedShipments
                .map((uploadedShipment) => <String, dynamic>{
                      'receiving_state': '1',
                      'receiving_city': '1',
                      'receiving_street': uploadedShipment.receivingStreet,
                      'receiving_landmark': uploadedShipment.receivingLandmark,
                      'date_to_receive_shipment':
                          uploadedShipment.dateToReceiveShipment,
                      'delivering_state': '1',
                      'delivering_city': '1',
                      'delivering_street': uploadedShipment.deliveringStreet,
                      'delivering_landmark':
                          uploadedShipment.deliveringLandmark,
                      'delivering_building_number':
                          uploadedShipment.deliveringBuildingNumber,
                      'delivering_floor': uploadedShipment.deliveringFloor,
                      'delivering_apartment':
                          uploadedShipment.deliveringApartment,
                      'delivering_lat': uploadedShipment.deliveringLat,
                      'delivering_lng': uploadedShipment.deliveringLng,
                      'payment_method': uploadedShipment.paymentMethod,
                      'date_to_deliver_shipment':
                          uploadedShipment.dateToDeliverShipment,
                      'client_name': uploadedShipment.clientName,
                      'client_phone': uploadedShipment.clientPhone,
                      'notes': uploadedShipment.notes,
                      'amount': uploadedShipment.amount,
                      'expected_shipping_cost':
                          uploadedShipment.expectedShippingCost,
                      'merchant_id': '37',
                      'products': List.generate(3, (i) => <String, dynamic>{
                        'id': 74,
                        'qty': 2,
                        'price': 10,
                      }).toList(),
                    })
                .toList(),
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MTZkY2NlNC0yZjI5LTQ4MjgtOGQ0Yi0wOTdhZjg5Nzk2ZTciLCJqdGkiOiJiZTQ3MzVlZjU2YTI4NTRlZmI1ZDE5ZDJmNThjNzc1ODdhMDUxOGQ3OGVlYTFkMTlhYzIwY2JhNTM5MzVjMzNhMzQ4YjkxMjNkZTQ1MGQyYSIsImlhdCI6MTY1MzM0NzMzNS4wNzY4NjQsIm5iZiI6MTY1MzM0NzMzNS4wNzY4NjksImV4cCI6MTY4NDg4MzMzNS4wNzQyNjksInN1YiI6IjM3Iiwic2NvcGVzIjpbXX0.BRpxEGvYjZMTKlMBGotFlgHHLhGnpf4DTnFgUYGe6cIbNaGQ6mHyO4N8Me9h6s_GrVGpkkSt5uio42jtBPWAhMygg7T-FHQaPnNQByBtYF2Y2p3epK-OmuyqaVdiGcujbtmtM0MDZPfIi3OLATQDsVKv7EX2F03wS4xmqKHnlk3lLhluT9x0ZPNvB154pX4UI4uLim17uJn-NV8LjhB3cj2UAaLnI5pCDXGRn8-3BebVtLKmNISL6ews3kMbYoeSynCUQuL30v_GEEw-H8ZErnslbWboVZlUuIsw-e0NU4LC-IHBr_QwBD03jkRjz00IMqbdJZAD86BxSeWx-Vd4UVfD68wmaXxRs41gqUnvmRZ4x0_xCR41rkCe38RpzewqO10wvAvnu7AhVk7yiWq83iPueZEPJ1Ezx91FDG-QtVMbGAGncan_ilRM2BsPRmhinK38f9ObnWfchkWAZ-jQdzILX3tgdqJX-d4Xa2TlcbW-qdgckHuBLokTiZuxmS_Fq8v79SalJDW13k6Qg32g6NgrbUhixiCgSkycsxpHAkJgn0Y7DwkMA88x7grhah4cQhd_f_4Fj6HxJ2L2nrwJYCNzuKSaZLhZmkx19GfRvwFl5sGZffssZ2r8UsLsRMBdZ_ntgxoILY1yJjulpIC7j7ssYPqWKzCDsw5heJyp1ic',
          'Accept': 'application/json'
        },
      );
      log('bulk shipment response -> ${r.body}');
      log('bulk shipment response -> ${r.statusCode}');
      if (r.statusCode >= 200 && r.statusCode < 300) {
        Navigator.pop(navigator.currentContext);
        showDialog(
          context: navigator.currentContext,
          barrierDismissible: false,
          builder: (ctx) => ActionDialog(
            content: 'تم اضافة الشحنات بنجاح',
            approveAction: 'حسناً',
            onApproveClick: () {
              Navigator.pop(ctx);
            },
          ),
        );
      } else {
        Navigator.pop(navigator.currentContext);
        showDialog(
          context: navigator.currentContext,
          barrierDismissible: false,
          builder: (ctx) => ActionDialog(
            content: 'حدث خطأ يرجي المحاولة مرة آخري',
            approveAction: 'حسناً',
            onApproveClick: () {
              Navigator.pop(ctx);
            },
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
