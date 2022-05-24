import 'package:flutter/material.dart';

enum NetworkState {
  success,
  error,
  loading,
}
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
