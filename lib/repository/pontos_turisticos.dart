import '../config/database/database_helper.dart';
import '../model/PontosTuristicos.dart';

class PontosTuristicosRepository{


  Future<PontosTuristicos> onSave(PontosTuristicos _pontoTuristico) async {
    final db = await DatabaseHelper.instance.db;
    if(_pontoTuristico!.id == 0){
      await db!.rawInsert("INSERT INTO pontos_turisticos(data, descricao,detalhes,diferenciais) VALUES (?,?,?,?);",
      [_pontoTuristico!.data.toString(), _pontoTuristico!.descricao, _pontoTuristico!.detalhes, _pontoTuristico!.diferenciais]);
    }
    else {
      await db!.rawUpdate(" UPDATE pontos_turisticos set data = ?, descricao = ?, detalhes = ?, diferenciais = ? WHERE id = ? ",
          [_pontoTuristico!.data.toString(),_pontoTuristico!.descricao,_pontoTuristico!.detalhes, _pontoTuristico!.diferenciais, _pontoTuristico!.id]);
    }

    return _pontoTuristico;
  }

  Future<void> onDelete(int _id) async {
    final db = await DatabaseHelper.instance.db;
      await db!.rawDelete("DELETE FROM pontos_turisticos where id =? ",
          [_id]);
  }

  Future<List<PontosTuristicos>> onGetAll(String _filterParams) async {
    final db = await DatabaseHelper.instance.db;
    var itens = <PontosTuristicos>[];
    List<Map> list = await db!.rawQuery("SELECT * FROM pontos_turisticos WHERE " + _filterParams);
    list.forEach((element) {
      PontosTuristicos item = new PontosTuristicos.fromJson(element);
      itens.add(item);
    });
    return itens;
  }
}