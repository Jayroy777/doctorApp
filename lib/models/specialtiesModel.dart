class SpecialtiesModel {
  SpecialtiesModel({
    List<Docs>? docs,
  }) {
    _docs = docs;
  }

  SpecialtiesModel.fromJson(dynamic json) {
    if (json['docs'] != null) {
      _docs = [];
      json['docs'].forEach((v) {
        _docs?.add(Docs.fromJson(v));
      });
    }
  }
  List<Docs>? _docs;
  SpecialtiesModel copyWith({
    List<Docs>? docs,
  }) =>
      SpecialtiesModel(
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
    String? image,
    String? name,
  }) {
    _id = id;
    _image = image;
    _name = name;
  }

  Docs.fromJson(dynamic json) {
    _id = json['_id'];
    _image = json['image'];
    _name = json['name'];
  }
  String? _id;
  String? _image;
  String? _name;
  Docs copyWith({
    String? id,
    String? image,
    String? name,
  }) =>
      Docs(
        id: id ?? _id,
        image: image ?? _image,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    return map;
  }
}
