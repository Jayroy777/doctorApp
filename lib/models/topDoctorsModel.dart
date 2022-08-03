class TopDoctorsModel {
  TopDoctorsModel({
    List<Docs>? docs,
  }) {
    _docs = docs;
  }

  TopDoctorsModel.fromJson(dynamic json) {
    if (json['docs'] != null) {
      _docs = [];
      json['docs'].forEach((v) {
        _docs?.add(Docs.fromJson(v));
      });
    }
  }
  List<Docs>? _docs;
  TopDoctorsModel copyWith({
    List<Docs>? docs,
  }) =>
      TopDoctorsModel(
        docs: docs ?? _docs,
      );
  List<Docs>? get docs => _docs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_docs != null) {
      map['docs'] = _docs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Docs {
  Docs({
    String? id,
    String? doctorId,
    String? doctorimg,
  }) {
    _id = id;
    _doctorId = doctorId;
    _doctorimg = doctorimg;
  }

  Docs.fromJson(dynamic json) {
    _id = json['_id'];
    _doctorId = json['doctorId'];
    _doctorimg = json['doctorimg'];
  }
  String? _id;
  String? _doctorId;
  String? _doctorimg;
  Docs copyWith({
    String? id,
    String? doctorId,
    String? doctorimg,
  }) =>
      Docs(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        doctorimg: doctorimg ?? _doctorimg,
      );
  String? get id => _id;
  String? get doctorId => _doctorId;
  String? get doctorimg => _doctorimg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['doctorId'] = _doctorId;
    map['doctorimg'] = _doctorimg;
    return map;
  }
}
