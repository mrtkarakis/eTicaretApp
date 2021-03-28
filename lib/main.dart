import 'package:e_ticaret_app/db/dbHelper.dart';
import 'package:e_ticaret_app/screens/UrunListesi.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'models/Urun.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Urun> urunler = new List<Urun>(); //urunler adında bir liste oluşturma işlemi
    DbHelper dbHelper = new DbHelper(); //database erişim
    dbHelper.dbOlustur().then((database) => {}); //sonucu görmek için then yapısını kullandık.

    // Urun urun1 = new Urun("Tv", "Akıllı Tv ", 6000);
    // dbHelper.ekle(urun1);
    // Urun urun2 = new Urun("Pc", "12gb Ram", 12000);
    // dbHelper.ekle(urun2);
    // Urun urun3 = new Urun("saat", "kol saati ", 600);
    // dbHelper.ekle(urun3);
    // Urun urun4 = new Urun("kulaklı", "7.1 kulaklı ", 1000);
    // dbHelper.ekle(urun4);


    return MaterialApp(
      title: "E-Ticaret Uygulaması",
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnaSayfaState();
  }
}

class AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Ticaret Uygulaması"),
      ),
      body: UrunListesi(),
    );
  }
}