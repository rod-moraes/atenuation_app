import 'package:flutter/material.dart';
import '../../../controller/calculadora_controller.dart';

class BotaoWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final CalculadoraController calculadoraController = CalculadoraController();
  BotaoWidget({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        index == 0
            ? calculadoraController.addObstaculo()
            : calculadoraController.removeObstaculo(index);
        onTap();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (index == 0) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (index == 0) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
