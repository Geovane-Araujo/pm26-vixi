import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../enuns/Menu.dart';
import '../model/PontosTuristicos.dart';
import '../repository/pontos_turisticos.dart';
import '../style/CustomStyle.dart';
import '../widgets/component/custom_input_date.dart';
import '../widgets/component/custom_input_text.dart';
import 'ListPontos.dart';
import 'form_pontos_turisticos.dart';

class ListPontosTuristicos extends StatefulWidget {
  const ListPontosTuristicos({Key? key}) : super(key: key);

  @override
  State<ListPontosTuristicos> createState() => _ListPontosTuristicosState();
}

class _ListPontosTuristicosState extends State<ListPontosTuristicos> {

  TextEditingController texfilter = new TextEditingController();
  TextEditingController datefilter = new TextEditingController();
  PontosTuristicosRepository pontos_repository = new PontosTuristicosRepository();
  @override
  void initState() {
    onReloadData();
  }

  onReloadData(){
    pontos_repository.onGetAll("1 = 1").then((value) => {
      setState(() {
        ListPontos.pontos = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista pontos turisticos"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                  child: Text("Filtros"),
                )
            ),
            CustomInputDate(
              controller: datefilter,
              hint: "Data Cadastros",
            ),
            CustomInputText(
              controller: texfilter,
              hint: "Nome/Descrição",
            ),
            InkWell(
              child: Container(
                  color: CustomStyle.backgroundColor,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "Filtrar",
                  )
              ),
              onTap: () {
              },
            )
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              child: retItens(context,ListPontos.pontos[index]),
            );
          },
          itemCount: ListPontos.pontos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          await Navigator.push(context,MaterialPageRoute(builder: (context) => FormPontosTuristicos()));
          setState(() {
            ListPontos.pontos;
          });
        },
      ),
    );
  }


  Widget retItens(context, PontosTuristicos ponto){

    return Container(
      height: 40,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  ponto.descricao,
                  style: TextStyle(
                  ),
                ),
              ),
            ),
            Container(
              width: 40,
              child: PopupMenuButton<Menu>(
                splashRadius: 1,
                tooltip: "Opções",
                icon: Icon(Icons.menu),
                onSelected: (Menu item) {
                  setState(() async {
                    if(item == Menu.Editar){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => FormPontosTuristicos(pontoT: ponto)));
                    } else {
                       await pontos_repository.onDelete(ponto!.id);
                    }
                    onReloadData();
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  PopupMenuItem<Menu>(
                    value: Menu.Editar,
                    child: Text('Editar'),
                  ),
                  PopupMenuItem<Menu>(
                    value: Menu.Excluir,
                    child: Text('Excluir'),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
