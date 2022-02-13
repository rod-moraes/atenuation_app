import 'package:flutter/material.dart';
import '../../../controller/calculadora_controller.dart';
import 'dropdown_obstaculo.dart';
import 'text_form_field_edit.dart';

class ObstaculoTextForm extends StatefulWidget {
  final int index;
  const ObstaculoTextForm({Key? key, required this.index}) : super(key: key);
  @override
  _ObstaculoTextFormState createState() => _ObstaculoTextFormState();
}

class _ObstaculoTextFormState extends State<ObstaculoTextForm> {
  final CalculadoraController calculadoraController = CalculadoraController();
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: DropdownObstaculo(
            initialValue: calculadoraController
                .obstaculoList[widget.index].distanciaReceptora,
            onSaved: (distanciaReceptora) =>
                calculadoraController.editaObstaculo(
                    distanciaReceptora: distanciaReceptora,
                    index: widget.index),
          )),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormFieldEdit(
              initialValue: calculadoraController
                          .obstaculoList[widget.index].distancia ==
                      0
                  ? ''
                  : calculadoraController.obstaculoList[widget.index].distancia
                      .toStringAsFixed(2),
              hintText: "Digite a distancia baseado no select anterior",
              labelText: "Distancia do obstáculo",
              suffix: "Metros",
              onSaved: (distancia) => calculadoraController.editaObstaculo(
                  distancia: distancia, index: widget.index),
              onChanged: (distancia) => calculadoraController.editaObstaculo(
                  distancia: distancia, index: widget.index),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormFieldEdit(
              hintText: "Digite a altura do obstáculo",
              labelText: "Altura do obstáculo",
              suffix: "Metros",
              initialValue:
                  calculadoraController.obstaculoList[widget.index].altura == 0
                      ? ''
                      : calculadoraController.obstaculoList[widget.index].altura
                          .toStringAsFixed(2),
              onSaved: (altura) => calculadoraController.editaObstaculo(
                  altura: altura, index: widget.index),
              onChanged: (altura) => calculadoraController.editaObstaculo(
                  altura: altura, index: widget.index),
            ),
          ),
        ],
      ),
    );
  }
}
