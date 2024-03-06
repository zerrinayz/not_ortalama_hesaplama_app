import 'package:flutter/material.dart';
import 'package:flutter_ortalama_hesapla/constans/app_constans.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({super.key, required this.ortalama, required this.dersSayisi});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girldi' : 'Ders Seciniz',
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(
          ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.ortalamaStyle,
        ),
        Text('Ortalama',
        style: Sabitler.ortalamaGosterBodyStyle,),
      ],
    );
  }
}