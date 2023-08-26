import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';
import 'package:oneline_grocery/view/main_tabview/main_tab_view.dart';
import 'package:oneline_grocery/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Groceries',
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: true,
      ),
      home: const MainTabView(),
    );
  }
}
