import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constans/app_constans.dart';
import 'package:flutter_ortalama_hesapla/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity //Bulunduğu ortama şekilde görünmesi için.
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}