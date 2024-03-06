import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ortalama_hesapla/constans/app_constans.dart';
import 'package:flutter_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:flutter_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:flutter_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:flutter_ortalama_hesapla/widgets/ortalama_goster.dart';

import '../model/ders.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi= '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Sabitler.baslikText, style: Sabitler.baslikStyle,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                  ortalama: DataHelper.ortalamaHesapla()),
              )
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index){
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });
              }, Function: (index) {  }, 
            ),
          ),
        ],
      ),
    );
  }
  
    Widget _buildForm() {
      return Form(
        key: formKey,
        child: Column(children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                padding: Sabitler.yatayPadding8,
                child: HarfDropdownWidget(
                  onHarfSecildi: (harf){
                      secilenHarfDegeri = harf;
                  },
                ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi){
                      secilenKrediDegeri = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Sabitler.anaRenk,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),

    );
  }
  
  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if(s!.length <= 0){
          return'Ders adını giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }
  

  void _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDegeri,
        krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        
      });
        
    }
  }

}