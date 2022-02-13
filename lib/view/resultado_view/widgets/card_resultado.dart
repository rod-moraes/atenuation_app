import 'package:atenuation_app/model/sist_obstaculo_model.dart';
import 'package:flutter/material.dart';

class CardResultado extends StatelessWidget {
  final int index;
  final SistObstaculoModel sistObstaculoModel;
  const CardResultado({
    Key? key,
    required this.index,
    required this.sistObstaculoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${index + 1}º atenuação:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("hv: ${sistObstaculoModel.hv.toStringAsFixed(2)} m", style: style),
        Text("h: ${sistObstaculoModel.h.toStringAsFixed(2)} m", style: style),
        Text("lambida: ${sistObstaculoModel.lambida.toStringAsFixed(2)}",
            style: style),
        Text("r1: ${sistObstaculoModel.r1.toStringAsFixed(2)} m", style: style),
        Text("v0: ${sistObstaculoModel.v0.toStringAsFixed(2)}", style: style),
        Text(
            "atenuacao: ${sistObstaculoModel.retornaAtenuacao.toStringAsFixed(2)}dB",
            style: style),
      ],
    );
  }
}
