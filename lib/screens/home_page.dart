import 'package:flutter/material.dart';
import 'package:my_dynamic_note_app/constants/app_constants.dart';
import 'package:my_dynamic_note_app/helper/data_helper.dart';
import 'package:my_dynamic_note_app/model/ders.dart';
import 'package:my_dynamic_note_app/widgets/ders_listesi.dart';

import '../widgets/ortalama_goster.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarf = 4.0; // Varsayılan harf AA
  double secilenKredi = 1.0; // Varsayılan kredi değeri
  String girilenDersAdi = "";// Varsayılan olarak boş

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          Constants.defaultHeader,
          style: Constants.headerTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                  child: OrtalamaGoster(
                ortalama: DataHelper.ortalamaHesapla(),
                dersSayisi: DataHelper.tumEklenenDersler.length,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Expanded(
            child: DersListesi(
              tumDersler: DataHelper.tumEklenenDersler,
              onDersDismissed: (index) {
                setState(() {
                  DataHelper.tumEklenenDersler.removeAt(index);
                });
                 ScaffoldMessenger.of(context).showSnackBar( // Silme işleminden sonra da SnackBar gösterebiliriz
                  const SnackBar(
                    content: Text("Ders silindi."),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: Constants.yatayPadding,
              child: buildTextFormField(),
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: Constants.yatayPadding,
                    child: _buildHarfler(),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: Constants.yatayPadding,
                    child: _buildKrediler(),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: _dersEkleVeHesapla,
                    icon: const Icon(Icons.arrow_forward_ios_sharp),
                    color: Constants.defaultColor,
                    iconSize: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
          girilenDersAdi = deger ?? "";
      },
      validator: (s){
        if (s!.isEmpty ) {
          return "Ders adı boş olamaz";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Ders Giriniz',
          border: OutlineInputBorder(borderRadius: Constants.borderRadius,borderSide: BorderSide.none)),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
        color: Constants.defaultColor.shade100.withOpacity(0.5),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarf,
        elevation: 16,
        iconEnabledColor: Constants.defaultColor.shade200,
        items: DataHelper.harfleriDropdownMenuItemListesi(),
        onChanged: (S) {
          setState(() {
            secilenHarf = S!;
          });
        },
        underline: Container(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
        color: Constants.defaultColor.shade100.withOpacity(0.5),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKredi, 
        elevation: 16,
        iconEnabledColor: Constants.defaultColor.shade200,
        items: DataHelper.kredileriDropdownMenuItemListesi(),
        onChanged: (S) {
          setState(() {
            secilenKredi = S!;
          });
        },
        underline: Container(),
      ),
    );
  }

  void _dersEkleVeHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(dersAdi: girilenDersAdi, kredi: secilenKredi, harfNotu: secilenHarf);
      
      setState(() {
        DataHelper.dersEkle(eklenecekDers);
        formKey.currentState!.reset();
        secilenHarf = 4.0; 
        secilenKredi = 1.0; 
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ders eklendi: ${eklenecekDers.dersAdi}"),
          duration: const Duration(seconds: 2), // const eklendi
        ),
      );
    }
  }
}
