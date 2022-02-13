import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'view/calculadora_view/calculadora_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('AA.Calc - Antenna Atenuation Calculator');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
    const frame = Rect.fromLTWH(0, 0, 1200, 768);
    setWindowFrame(frame);
  }
  runApp(const AppWidget());
}

class Utilities {
  static Color colorPrimary = const Color(0xff6C63FF);
  static Color colorSecondary = const Color(0xff3F3D56);
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Utilities.colorSecondary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "AA.Calc",
      home: CalculadoraView(),
    );
  }
}
