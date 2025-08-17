import 'package:flutter/material.dart';
import 'package:my_dynamic_note_app/constants/app_constants.dart';
import 'package:my_dynamic_note_app/model/ders.dart';

class DersListesi extends StatelessWidget {
  final List<Ders> tumDersler;
  final Function(int dismissedItemIndex) onDersDismissed;

  const DersListesi({
    super.key,
    required this.tumDersler,
    required this.onDersDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              Ders ders = tumDersler[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDersDismissed(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${ders.dersAdi} dersi silindi"),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(ders.dersAdi),
                      leading: CircleAvatar(
                        backgroundColor: Constants.defaultColor,
                        child: Text(
                          (ders.harfNotu * ders.kredi).toStringAsFixed(1),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: Text(
                          "Kredi: ${ders.kredi}, Harf Notu: ${ders.harfNotu}"),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Henüz ders eklenmedi",
              style: Constants.headerTextStyle,
            ),
          );
  }
}
