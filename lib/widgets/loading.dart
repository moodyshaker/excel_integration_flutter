import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        child: Container(
          height: 120.0,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: const[
               Text('برجاء الأنتظار\nجاري تحميل الشحنات',
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
                SpinKitDoubleBounce(
                size: 30,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
