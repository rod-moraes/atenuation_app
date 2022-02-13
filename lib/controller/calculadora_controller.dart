import 'package:atenuation_app/model/sistema_model.dart';
import 'package:flutter/material.dart';

import '../model/obstaculo_model.dart';
import '../model/sist_obstaculo_model.dart';
import '../view/resultado_view/resultado_view.dart';

class CalculadoraController {
  static final CalculadoraController _singleton =
      CalculadoraController._internal();

  CalculadoraController._internal();
  factory CalculadoraController() => _singleton;

  List<ObstaculoModel> obstaculoList = [
    ObstaculoModel(distanciaReceptora: true, altura: 0, distancia: 0)
  ];

  List<SistObstaculoModel> sistObstaculoList = [];

  double? _frequencia;
  double? _alturaTransmissao;
  double? _alturaReceptora;
  double? _distanciaTotal;
  double? _raioEfetivo;

  //EDITA SISTEMA
  void setFrequencia(double? valor) => _frequencia = valor ?? _frequencia;
  void setAlturaTransmissao(double? valor) =>
      _alturaTransmissao = valor ?? _alturaTransmissao;
  void setAlturaReceptora(double? valor) =>
      _alturaReceptora = valor ?? _alturaReceptora;
  void setDistanciaTotal(double? valor) =>
      _distanciaTotal = valor ?? _distanciaTotal;
  void setRaioEfetivo(double? valor) => _raioEfetivo = valor ?? _raioEfetivo;

  //EDITA OBSTACULO
  void addObstaculo() => obstaculoList
      .add(ObstaculoModel(altura: 0, distancia: 0, distanciaReceptora: true));

  void removeObstaculo(int index) => obstaculoList.removeAt(index);

  void editaObstaculo(
          {double? altura,
          double? distancia,
          bool? distanciaReceptora,
          required int index}) =>
      obstaculoList[index] = obstaculoList[index].copyWith(
          altura: altura,
          distancia: distancia,
          distanciaReceptora: distanciaReceptora);

  void calculaAtenuacao(BuildContext context) {
    List<ObstaculoModel> listaObstaculos = obstaculoList.toList();
    SistemaModel sistema = SistemaModel(
      alturaReceptora: _alturaReceptora!,
      alturaTransmissora: _alturaTransmissao!,
      frequencia: _frequencia!,
      pontoReceptora: 0,
      pontoTransmissora: _distanciaTotal!,
      raioEfetivo: _raioEfetivo,
    );

    listaObstaculos = listaObstaculos.map((e) {
      if (!e.distanciaReceptora) {
        return e.copyWith(distancia: sistema.pontoTransmissora - e.distancia);
      }
      return e;
    }).toList();
    listaObstaculos.sort((a, b) => a.distancia.compareTo(b.distancia));
    sistObstaculoList.clear();
    double atenuacaoFinal =
        atenuacao(obstaculos: listaObstaculos, sistema: sistema);

    showDialog(
        context: context,
        builder: (BuildContext context) => ResultadoView(
              atenuationFinal: atenuacaoFinal,
              listSistObstaculos: sistObstaculoList,
            ));
    print(sistObstaculoList);
    print(atenuacaoFinal);
  }

  double atenuacao(
      {required SistemaModel sistema,
      required List<ObstaculoModel> obstaculos}) {
    if (obstaculos.isEmpty) return 0;
    List<ObstaculoModel> sortObstaculos = obstaculos.toList();
    sortObstaculos.sort((a, b) => a.altura.compareTo(b.altura));
    int index = obstaculos.indexOf(sortObstaculos.last);

    SistObstaculoModel calculaSistema =
        SistObstaculoModel(obstaculo: sortObstaculos.last, sistema: sistema);

    if (calculaSistema.interfere) {
      sistObstaculoList.add(calculaSistema.copyWith());
      if (calculaSistema.pertoTransmissora) {
        for (int i = index; i < obstaculos.length; i++) {
          obstaculos.removeAt(i);
        }
        return calculaSistema.retornaAtenuacao +
            atenuacao(
                obstaculos: obstaculos,
                sistema: sistema.copyWith(
                    alturaTransmissora: calculaSistema.obstaculo.altura,
                    pontoTransmissora: calculaSistema.pontoTransmissora));
      } else {
        for (int i = index; i >= 0; i--) {
          obstaculos.removeAt(i);
        }
        return calculaSistema.retornaAtenuacao +
            atenuacao(
                obstaculos: obstaculos,
                sistema: sistema.copyWith(
                    alturaReceptora: calculaSistema.obstaculo.altura,
                    pontoReceptora: calculaSistema.pontoReceptora));
      }
    } else {
      return 0;
    }
  }
}
