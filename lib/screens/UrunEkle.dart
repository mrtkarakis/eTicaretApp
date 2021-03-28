import 'package:e_ticaret_app/db/dbHelper.dart';
import 'package:e_ticaret_app/main.dart';
import 'package:e_ticaret_app/models/Urun.dart';
import 'package:flutter/material.dart';

class UrunEkle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UrunEkleState();
  }

}

class UrunEkleState extends State {

  DbHelper dbHelper = new DbHelper();

  TextEditingController txtAd = new TextEditingController();
  TextEditingController txtAciklama = new TextEditingController();
  TextEditingController txtFiyat = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("yeni ürün ekle"),

      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: txtAd,
              decoration: InputDecoration(labelText: "Ad"),
            ),
            TextField(
              controller: txtAciklama,
              decoration: InputDecoration(labelText: "Açıklama"),
            ),
            TextField(
              controller: txtFiyat,
              decoration: InputDecoration(labelText: "Fiyat"),
            ),
            TextButton(
                onPressed: () {ekle();},
                child: Text("Ekle"),
            )
          ],
        ),
      ),


    );
  }

  void ekle() async {

    int sonuc = await dbHelper.ekle(Urun(txtAd.text,txtAciklama.text,double.tryParse(txtFiyat.text)));
    if (sonuc != 0){
      Navigator.pop(context, true);
      AlertDialog alertDialog = new AlertDialog(
          title: Text("İşlem Başarılı"),
        content: Text("Eklenen ürün ${txtAd.text}"),);
      showDialog(context: context, builder: (context)=> alertDialog );
    }
  }

}