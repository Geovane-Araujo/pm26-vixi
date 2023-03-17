import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    if(widget.pontoT != null){
      description.text = widget.pontoT!.descricao;
      detail.text = widget.pontoT!.detalhes;
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
                      hint: "Descrição",
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
                Random r = new Random();
                PontosTuristicos ponto = new PontosTuristicos(data: DateTime.now());

                ponto.descricao = description.text;
                ponto.data = DateTime.now();
                ponto.detalhes = detail.text;

                if(widget.pontoT == null){
                  ponto.id = r.nextInt(10000);
                  ListPontos.pontos.add(ponto);
                } else {
                  int index = 1;
                  ponto.id = widget.pontoT!.id;
                  ListPontos.pontos.removeWhere((element) => element.id == widget.pontoT!.id );
                  ListPontos.pontos.add(ponto);
                }

                Navigator.pop(context,MaterialPageRoute(builder: (context) => ListPontosTuristicos()));
              },
            ),
          )
        ],
      ),
    );
  }
}
