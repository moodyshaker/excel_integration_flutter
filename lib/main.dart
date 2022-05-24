import 'package:date_time_approach/provider/shipment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/network_state/network_state.dart';
import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShipmentProvider(),
      child: MaterialApp(
        navigatorKey: navigator,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
