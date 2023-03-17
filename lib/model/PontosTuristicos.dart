class PontosTuristicos {


  PontosTuristicos({
       this.id = 0,
       required this.data,
       this.descricao = "",
       this.detalhes = "",});

  PontosTuristicos.fromJson(dynamic json) {
    id = json['id'];
    data = json['data'];
    descricao = json['descricao'];
    detalhes = json['detalhes'];
  }

  int id = 0;
  DateTime data = DateTime.now();
  String descricao = "";
  String detalhes = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['descricao'] = descricao;
    map['detalhes'] = detalhes;
    return map;
  }

}