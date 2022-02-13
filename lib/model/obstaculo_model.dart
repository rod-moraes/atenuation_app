import 'dart:convert';

class ObstaculoModel {
  final double altura;
  final double distancia;
  final bool distanciaReceptora;
  ObstaculoModel({
    required this.altura,
    required this.distancia,
    required this.distanciaReceptora,
  });

  ObstaculoModel copyWith({
    double? altura,
    double? distancia,
    bool? distanciaReceptora,
  }) {
    return ObstaculoModel(
      altura: altura ?? this.altura,
      distancia: distancia ?? this.distancia,
      distanciaReceptora: distanciaReceptora ?? this.distanciaReceptora,
    );
  }

  @override
  String toString() =>
      'ObstaculoModel(altura: $altura, distancia: $distancia, distanciaReceptora: $distanciaReceptora)';
}
