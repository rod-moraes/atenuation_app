import 'package:atenuation_app/view/resultado_view/widgets/card_resultado.dart';
import 'package:flutter/material.dart';

import 'package:atenuation_app/main.dart';

import '../../model/sist_obstaculo_model.dart';

class ResultadoView extends StatelessWidget {
  final List<SistObstaculoModel> listSistObstaculos;
  final double atenuationFinal;
  const ResultadoView({
    Key? key,
    required this.listSistObstaculos,
    required this.atenuationFinal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: TextStyle(backgroundColor: Utilities.colorSecondary),
      title: Container(
        decoration: BoxDecoration(
          color: Utilities.colorSecondary,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const Text(
          "Resultado",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      content: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < listSistObstaculos.length; i++) ...[
                CardResultado(
                    index: i, sistObstaculoModel: listSistObstaculos[i]),
                const SizedBox(height: 30)
              ],
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: EdgeInsets.zero,
      actions: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                color: Utilities.colorSecondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Atenuação final: ${atenuationFinal.toStringAsFixed(2)}dB",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const VerticalDivider(
                  width: 1, thickness: 1, color: Colors.white),
              Expanded(
                child: Material(
                  color: Utilities.colorSecondary,
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: const Center(
                          child: Text("SAIR",
                              style: TextStyle(color: Colors.white))),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
