import 'package:flutter/material.dart';
import 'package:my_dynamic_note_app/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster({
    super.key,
    required this.ortalama,
    required this.dersSayisi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders girildi" : "Ders seçiniz", style: Constants.ortalamaBodyStyle,
        ),
       Text(ortalama >= 0 ? ortalama.toStringAsFixed(2) : "0.0",style: Constants.ortStyle,),
        Text(
          "Ortalama",
          style: Constants.ortalamaBodyStyle,
        ),


      ],
    );
  }
}
