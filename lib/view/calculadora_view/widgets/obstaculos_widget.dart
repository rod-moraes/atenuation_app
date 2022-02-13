import 'package:flutter/material.dart';

import '../../../controller/calculadora_controller.dart';
import '../../../main.dart';
import 'botao_widget.dart';
import 'obstaculo_text_form.dart';

class ObstaculosWidget extends StatefulWidget {
  const ObstaculosWidget({Key? key}) : super(key: key);

  @override
  State<ObstaculosWidget> createState() => _ObstaculosWidgetState();
}

class _ObstaculosWidgetState extends State<ObstaculosWidget> {
  final ScrollController _scrollControllerObstaculo = ScrollController();
  final CalculadoraController calculadoraController = CalculadoraController();

  @override
  Widget build(BuildContext context) {
    double spacing = 10;
    return SingleChildScrollView(
      controller: _scrollControllerObstaculo,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            SizedBox(height: spacing),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: 10),
              decoration: BoxDecoration(
                  color: Utilities.colorSecondary,
                  borderRadius: BorderRadius.circular(20)),
              child: const Text('OBSTÁCULOS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white)),
            ),
            SizedBox(height: 10),
            for (int i = 0; i < calculadoraController.obstaculoList.length; i++)
              Padding(
                key: UniqueKey(),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(child: ObstaculoTextForm(index: i)),
                    const SizedBox(width: 16),
                    // we need add button at last friends row only
                    BotaoWidget(
                      index: i,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
