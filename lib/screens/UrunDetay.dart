import 'package:e_ticaret_app/db/dbHelper.dart';
import 'package:e_ticaret_app/main.dart';
import 'package:e_ticaret_app/models/Urun.dart';
import 'package:flutter/material.dart';

class UrunDetay extends StatefulWidget {
  Urun urun;
  UrunDetay(this.urun);

  @override
  State<StatefulWidget> createState() {
    return UrunDetayState(urun);
  }
}

DbHelper dbHelper = new DbHelper();
enum Secenek { sil, guncelle }

class UrunDetayState extends State {
  Urun urun;
  UrunDetayState(this.urun);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ürün Detayı : ${urun.ad}"), actions: [
        PopupMenuButton<Secenek>(
          onSelected: islemSec,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Secenek>>[
            PopupMenuItem<Secenek>(
              value: Secenek.sil,
              child: Text("Ürünü Sil"),
            ),
            PopupMenuItem<Secenek>(
                value: Secenek.guncelle, child: Text("Güncelle")),
          ],
        )
      ]),
      body: Column(
        children: [
          ListTile(
            // minVerticalPadding: 50, // kayan blok, her blok arası 50pxl mesafe
            // minLeadingWidth: 50,
            contentPadding: EdgeInsets.only(top:12,left: 8),
            leading: Icon(Icons.shop_outlined,size: 52,),
            title: Text(urun.ad,style: TextStyle(fontSize: 25),),
            subtitle: Text(urun.aciklama),
          ),
          Text("${urun.ad} fiyatı : ${urun.fiyat} ₺",style: TextStyle(fontSize: 18,color: Colors.blueGrey),textDirection: TextDirection.ltr,textAlign: TextAlign.right,),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  AlertDialog alertDialog = new AlertDialog(
                    title: Text("Ürün Sepete eklendi"),
                    content: Text("helaaal"),
                  );
                  showDialog(context: context, builder:(_) => alertDialog);
                },
                child: RichText(
                    text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.add,size: 20,),
                          ),
                          TextSpan(
                              text: " Sepete ekle",
                              style: TextStyle(color: Colors.blue,fontSize: 20,)
                          ),
                        ]
                    )
                ) ,



              ),
              // Text("Sepete                                   Ekle",textDirection: TextDirection.ltr, textAlign: TextAlign.center)
              // Center(
              //   child: Text("Sepete Ekle",textAlign: TextAlign.center,),
              // )
            ],
          )
        ],
      ),
    );
  }

  void islemSec(Secenek secenek) async {
    int sonuc;
    switch (secenek) {
      case Secenek.sil:
        Navigator.pop(context, true);
        sonuc = await dbHelper.sil(urun.id);
        if (sonuc != 0) {
          AlertDialog alertDialog = new AlertDialog(
            title: Text("İŞLEM BAŞARILI"),
            content: Text("Silinen Ürün : ${urun.ad}"),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
    }
  }
}
