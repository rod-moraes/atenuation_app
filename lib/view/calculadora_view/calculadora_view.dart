import 'package:atenuation_app/main.dart';
import 'package:atenuation_app/model/sistema_model.dart';
import 'package:flutter/material.dart';
import '../../controller/calculadora_controller.dart';
import '../../model/obstaculo_model.dart';
import 'widgets/obstaculos_widget.dart';
import 'widgets/sistema_widget.dart';

class CalculadoraView extends StatefulWidget {
  const CalculadoraView({Key? key}) : super(key: key);

  @override
  _CalculadoraViewState createState() => _CalculadoraViewState();
}

class _CalculadoraViewState extends State<CalculadoraView> {
  final _formKey = GlobalKey<FormState>();
  final CalculadoraController calculadoraController = CalculadoraController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AA.Calc - Antenna Atenuation Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8.0),
        child: Form(
          key: _formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: SistemaWidget()),
              Expanded(flex: 3, child: ObstaculosWidget()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Utilities.colorSecondary,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              calculadoraController.calculaAtenuacao(context);
            }
          },
          extendedPadding: EdgeInsets.all(
            MediaQuery.of(context).size.height * 0.035,
          ),
          icon: Icon(
            Icons.calculate,
            size: MediaQuery.of(context).size.height * 0.035,
          ),
          label: Text(
            "Calcular",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
