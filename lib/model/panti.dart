import 'dart:convert';

class Panti {
  final String id;
  final String name;
  final String telp;
  final String urlImg;
  final String address;

  Panti({this.id, this.name, this.urlImg, this.address, this.telp});

  factory Panti.fromJson(Map<String, dynamic> json) {
    return Panti(
      id: json['id'],
      name: json['name'],
      telp: json['telepon'],
      urlImg: json['urlImg'],
      address: json['address'],
    );
  }
}

List<Panti> parsePanti(String json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((e) => Panti.fromJson(e)).toList();
}
