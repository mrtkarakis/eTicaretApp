class Urun{
  int _id;
  String _ad;
  String _aciklama;
  double _fiyat;

  Urun(this._ad,this._aciklama,this._fiyat);
  Urun.withId(this._id,this._ad,this._aciklama,this._fiyat);


  int get id => _id; // verileri alamk ya da okumak için kullanılır.

  set id(int value) { // verileri değiştirmek için kullanılır.
    _id = value;
  }

  String get ad => _ad;

  set ad(String value) {
    _ad = value;
  }

  String get aciklama => _aciklama;

  set aciklama(String value) {
    _aciklama = value;
  }

  double get fiyat => _fiyat;

  set fiyat(double value) {
    _fiyat = value;
  }

  Map<String , dynamic> MapYap(){ //ürünü map'e çevirme
    var map = Map<String, dynamic>();
    map["ad"] = _ad;
    map["aciklama"] = _aciklama;
    map["fiyat"] = _fiyat;
    if (_id != null){
      map["id"] = _id;
    }
    return map;

  }


  Urun.fromObject(dynamic o){ //map'i ürüne çevirme
    this._id = o["id"];
    this._ad = o["ad"];
    this._aciklama = o["aciklama"];
    this._fiyat = double.tryParse(o["fiyat"].toString());  //sqflite'ta sadece number tutulduğu için double'a çeviriyoruz.
  }

}
