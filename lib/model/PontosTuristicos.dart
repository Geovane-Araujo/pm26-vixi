import 'package:intl/intl.dart';

class PontosTuristicos {




  PontosTuristicos({
       this.id = 0,
       required this.data,
       this.descricao = "",
       this.detalhes = "",
       this.diferenciais = ""});

  PontosTuristicos.fromJson(dynamic json) {
    id = json['id'];
    data = DateTime.parse(json['data']);
    descricao = json['descricao'];
    detalhes = json['detalhes'];
    diferenciais = json['diferenciais'];
  }

  int id = 0;
  DateTime data = DateTime.now();
  String descricao = "";
  String detalhes = "";
  String diferenciais = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['descricao'] = descricao;
    map['detalhes'] = detalhes;
    map['diferenciais'] = diferenciais;
    return map;
  }

}