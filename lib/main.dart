import 'package:flutter/material.dart';
import 'package:reorderable_list_/navigation.dart/on_generate_route.dart';
import 'package:reorderable_list_/pages/data_list_page.dart';

GlobalKey<AnimatedListState> listGlobalKey = GlobalKey<AnimatedListState>();
List<String> dataList = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Records',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
      home: const DataListPage(),
    );
  }
}
