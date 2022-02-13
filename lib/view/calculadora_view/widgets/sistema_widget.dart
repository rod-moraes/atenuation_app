import 'package:atenuation_app/main.dart';
import 'package:flutter/material.dart';

import '../../../controller/calculadora_controller.dart';
import 'text_form_field_edit.dart';

class SistemaWidget extends StatelessWidget {
  SistemaWidget({Key? key}) : super(key: key);
  final CalculadoraController calculadoraController = CalculadoraController();

  @override
  Widget build(BuildContext context) {
    double spacing = 20;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 10),
            decoration: BoxDecoration(
                color: Utilities.colorSecondary,
                borderRadius: BorderRadius.circular(20)),
            child: const Text(
              "SISTEMA",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: spacing + 5),
          TextFormFieldEdit(
            hintText: 'Digite a frequência',
            labelText: 'Frequência',
            suffix: "Hertz",
            onSaved: calculadoraController.setFrequencia,
          ),
          SizedBox(height: spacing),
          TextFormFieldEdit(
            hintText: 'Digite a altura da antena de transmissão',
            labelText: 'Antena de transmissão',
            suffix: "Metros",
            onSaved: calculadoraController.setAlturaTransmissao,
          ),
          SizedBox(height: spacing),
          TextFormFieldEdit(
            hintText: 'Digite a altura da antena de receptora',
            labelText: 'Antena de receptora',
            suffix: "Metros",
            onSaved: calculadoraController.setAlturaReceptora,
          ),
          SizedBox(height: spacing),
          TextFormFieldEdit(
            hintText: 'Digite a distancia total entre as antenas',
            labelText: 'Distancia total',
            suffix: "Metros",
            onSaved: calculadoraController.setDistanciaTotal,
          ),
          SizedBox(height: spacing),
          TextFormFieldEdit(
            hintText: 'Digite o raio efetivo da terra *OPICIONAL',
            labelText: 'Raio efetivo',
            suffix: "Metros",
            isRequired: false,
            onSaved: calculadoraController.setRaioEfetivo,
          ),
          SizedBox(height: spacing),
          if (MediaQuery.of(context).size.height >= 650)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  'lib/assets/images/logo.png',
                ),
              ),
            )
        ],
      ),
    );
  }
}
