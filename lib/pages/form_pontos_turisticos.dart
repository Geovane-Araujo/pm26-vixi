import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixi/repository/pontos_turisticos.dart';

import '../model/PontosTuristicos.dart';
import '../style/CustomStyle.dart';
import '../widgets/component/custom_button.dart';
import '../widgets/component/custom_input_date.dart';
import '../widgets/component/custom_input_text.dart';
import '../widgets/component/custom_input_text_area.dart';
import 'ListPontos.dart';
import 'list_pontos_turisitcos.dart';


class FormPontosTuristicos extends StatefulWidget {

  final PontosTuristicos? pontoT;

  const FormPontosTuristicos({
    this.pontoT,
    Key? key
  }) : super(key: key);

  @override
  State<FormPontosTuristicos> createState() => _FormPontosTuristicosState();
}

class _FormPontosTuristicosState extends State<FormPontosTuristicos> {

  TextEditingController description = new TextEditingController();
  TextEditingController detail = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController diferenciais = new TextEditingController();
  var _id = null;

  @override
  void initState() {
    if(widget.pontoT != null){
      description.text = widget.pontoT!.descricao;
      detail.text = widget.pontoT!.detalhes;
      diferenciais.text = widget.pontoT!.diferenciais;
      _id = widget.pontoT!.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de pontos turisticos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    CustomInputDate(
                      controller: date,
                      hint: "Data Cadastros",
                      visible: false,
                    ),
                    CustomInputText(
                      controller: description,
                      hint: "Nome",
                    ),
                    CustomInputTextArea(
                      controller: detail,
                      hint: "Detalhes",
                    ),
                    CustomInputTextArea(
                      controller: diferenciais,
                      hint: "Diferenciais",
                    ),
                  ],
                ),
              )
          ),
          Container(
            height: 50,
            child: CustomButton(
              backgroundColor: CustomStyle.primaryColor,
              hint: "Salvar",
              onPressed: () {
                PontosTuristicos ponto = new PontosTuristicos(data: DateTime.now());
                ponto.descricao = description.text;
                ponto.data = DateTime.now();
                ponto.detalhes = detail.text;
                ponto.diferenciais = diferenciais.text;
                if(_id != null)
                  ponto.id = _id;

                PontosTuristicosRepository pontos_repository = new PontosTuristicosRepository();
                pontos_repository.onSave(ponto);

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ListPontosTuristicos()));
              },
            ),
          )
        ],
      ),
    );
  }
}
