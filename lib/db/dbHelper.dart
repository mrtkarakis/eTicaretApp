import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:e_ticaret_app/models/Urun.dart';


class DbHelper{
  String tblUrun = "urunler";  // urunler adında tablo
  String colId = "id";  //id adında colon
  String colAd = "ad";  //ad adında colon
  String colAciklama = "aciklama";  //aciklama adında colon
  String colFiyat = "fiyat";  //fiyat adında colon

  DbHelper._internal(); // yapıları new demeden static olarak kolayca kullanmak için

  static final DbHelper _dbHelper = DbHelper._internal(); // kolaylaştırıcı yapı, yani static olarak sürekli yazmak yerine _dbHelper'ın içine _internal kısmını tanımlıyoruz.


  factory DbHelper(){ //sürekli yeni bağlantı kurmamak için new ile dbHelper'a bağlanmamalıyız o sebeple static olarak çalışıyoruz.
    return _dbHelper;
  }

  static Database _db; // veri tabanına erişmek istediğimizi belirtiyoruz.

  Future<Database> get db async{  //database'i çalıştırıyoruz,
    if (_db == null){ //_db oluşturulmuş mu kontrol ediyoruz
      _db = await dbOlustur(); //oluşturulmamışsa kendimiz oluşturuyoruz
    }else{
      return _db; //oluşturulmuşsa oluşan _db yi döndürüyoruz.
    }
  }

  Future<Database> dbOlustur() async{
    Directory directory = await getApplicationDocumentsDirectory(); //directory yapısında  getApplicationDocumentsDirectory() fonk ile belirtilen uygulamaın dökümasyonlarına gitmesini söylüyruz
    String yol = directory.path + "eTicaret.db";  //veritabanının yolunu oluşturma.
    var eTicaretDb = await openDatabase(yol,version: 1, onCreate: olustur); //veritabanı oluşturma.
    return eTicaretDb;
  }


  void olustur(Database db, int version) async{
    await db.execute("create Table $tblUrun($colId integer primary key, $colAd text, $colAciklama text,$colFiyat int )");
  }

  Future<int> ekle (Urun urun) async{
    Database db = await this.db; //Database bağlanma işlemi
    var sonuc = await db.insert(tblUrun, urun.MapYap()); //tablo değerlerini map a dönüştürme işlemi
    return sonuc;
  }

  Future <List> getUrunler()async{
    Database db = await this.db; //Database bağlanma işlemi.
    var sonuc = await db.rawQuery("Select * from $tblUrun"); //tablonun tamamını getirme işlemi
    return sonuc;
  }

  Future<int> sil (int id) async{
    Database db = await this.db; //Database bağlanma işlemi
    var sonuc = await db.rawDelete("Delete from $tblUrun where $colId = $id "); //tablodan belirli id yi silme işlemi
    return sonuc;
  }




}
