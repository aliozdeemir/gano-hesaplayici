import 'package:flutter/material.dart';
import 'package:my_dynamic_note_app/model/ders.dart';

class DataHelper {

  static List<Ders> tumEklenenDersler = [];

  static void dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static List<String> tumDersleriGetir(){
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FF"];
  }

  static double ortalamaHesapla(){
    double toplamNot = 0.0;
    double toplamKredi = 0.0;
    for (Ders ders in tumEklenenDersler) {
      toplamNot += ders.harfNotu * ders.kredi;
      toplamKredi += ders.kredi;
    }

    return toplamKredi > 0 ? toplamNot / toplamKredi : 0.0;

  }

  static double harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FF":
        return 0.0;
      default:
        return 0.0;
    }
  }

  static List<DropdownMenuItem<double>> harfleriDropdownMenuItemListesi() {
    List<String> tumDersler = tumDersleriGetir();
    return tumDersler.map((harf) {
      return DropdownMenuItem<double>(
        value: harfiNotaCevir(harf),
        child: Text(harf),
      );
    }).toList();
  }

  static List<int> tumKrediler(){
    return List.generate(10, (index) =>index+1).toList();
  }


  static List<DropdownMenuItem<double>> kredileriDropdownMenuItemListesi() {
    return tumKrediler().map((kredi) {
      return DropdownMenuItem<double>(
        value: kredi.toDouble(),
        child: Text("$kredi"),
      );
    }).toList();
  }


}