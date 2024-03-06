      import 'package:flutter/material.dart';
      import 'package:flutter_ortalama_hesapla/constans/app_constans.dart';
      import 'package:flutter_ortalama_hesapla/helper/data_helper.dart';
      import 'package:flutter_ortalama_hesapla/model/ders.dart';

      class DersListesi extends StatefulWidget {
        final Function onElemanCikarildi;
        const DersListesi({super.key, required this.onElemanCikarildi, required Null Function(dynamic index) });

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
        @override
        Widget build(BuildContext context) {
          List<Ders> tumDersler = DataHelper.tumEklenenDersler;

        return tumDersler.length > 0 
          ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context,index){
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              onDismissed: (a) {
                onElemanCikarildi(index);
            
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].ad),
                    leading: CircleAvatar(
                      backgroundColor: Sabitler.anaRenk,
                      child: Text(
                        (tumDersler[index].harfDegeri *
                              tumDersler[index].krediDegeri)
                          .toStringAsFixed(0),
                      ),
                    ),
                    subtitle: Text('${tumDersler[index].krediDegeri} Kredi, Not Degeri ${tumDersler[index].harfDegeri}'),
                  ),
                ),
              ),
            );
          })
        : Container(
              child: Center(
                child: Text(
                'Lütfen Ders Ekleyin',
              style: Sabitler.baslikStyle,
                ),
              ),
          );
      }
}

void onElemanCikarildi(int index) {
}