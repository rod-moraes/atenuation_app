import 'dart:math';

import '../model/obstaculo_model.dart';
import '../model/sistema_model.dart';

class SistObstaculoModel {
  final ObstaculoModel obstaculo;
  final SistemaModel sistema;
  SistObstaculoModel({
    required this.obstaculo,
    required this.sistema,
  });

  double get distanciaObsTransmissora =>
      sistema.distanciaSisTotal - distanciaObsReceptora;

  double get pontoTransmissora =>
      sistema.pontoTransmissora - distanciaObsTransmissora;

  double get distanciaObsReceptora =>
      obstaculo.distancia - sistema.pontoReceptora;

  double get pontoReceptora => sistema.pontoReceptora + distanciaObsReceptora;

  bool get pertoTransmissora =>
      distanciaObsTransmissora < distanciaObsReceptora;

  double get hTransmissora {
    if (sistema.raioEfetivo != null && sistema.raioEfetivo != 0) {
      return sistema.alturaTransmissora -
          ((distanciaObsTransmissora * distanciaObsTransmissora) /
              (2 * sistema.raioEfetivo!));
    } else {
      return sistema.alturaTransmissora;
    }
  }

  double get hReceptora {
    if (sistema.raioEfetivo != null && sistema.raioEfetivo != 0) {
      return sistema.alturaReceptora -
          ((distanciaObsReceptora * distanciaObsReceptora) /
              (2 * sistema.raioEfetivo!));
    } else {
      return sistema.alturaReceptora;
    }
  }

  bool get interfere => obstaculo.altura >= (45 / 100) * r1;

  double get hv {
    double valor = ((hTransmissora - hReceptora) /
        (distanciaObsTransmissora + distanciaObsReceptora));
    return distanciaObsReceptora * valor + hReceptora;
  }

  double get h {
    return obstaculo.altura - hv;
  }

  double get lambida {
    return 300000000 / sistema.frequencia;
  }

  double get r1 {
    double valor =
        (lambida * distanciaObsTransmissora * distanciaObsReceptora) /
            (distanciaObsTransmissora + distanciaObsReceptora);
    return sqrt(valor);
  }

  double get v0 {
    return sqrt(2) * (h / r1);
  }

  double log10(double valor) => log(valor) / ln10;

  double get retornaAtenuacao {
    double atenuacao = 0;
    double v0D = v0;
    if (v0D > (-0.8) && v0D < 0) {
      atenuacao = (-20) * log10(0.5 - (0.62 * v0D));
    } else if (v0D >= 0 && v0D < 1) {
      atenuacao = (-20) * log10(0.5 * exp(-0.95 * v0D));
    } else if (v0D >= 1 && v0D < 2.4) {
      atenuacao =
          (-20) * log10((0.4 - (sqrt(0.1184 - (pow(0.38 - (0.1 * v0D), 2))))));
    } else if (v0D >= 2.4) {
      atenuacao = (-20) * log10(0.255 / v0D);
    }
    return atenuacao;
  }

  SistObstaculoModel copyWith({
    ObstaculoModel? obstaculo,
    SistemaModel? sistema,
  }) {
    return SistObstaculoModel(
      obstaculo: obstaculo ?? this.obstaculo,
      sistema: sistema ?? this.sistema,
    );
  }

  @override
  String toString() =>
      'SistObstaculoModel(obstaculo: $obstaculo, sistema: $sistema)';
}
