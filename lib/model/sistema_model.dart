class SistemaModel {
  final double frequencia;
  final double alturaTransmissora;
  final double alturaReceptora;
  final double pontoReceptora;
  final double pontoTransmissora;
  final double? raioEfetivo;
  SistemaModel({
    required this.frequencia,
    required this.alturaTransmissora,
    required this.alturaReceptora,
    required this.pontoReceptora,
    required this.pontoTransmissora,
    this.raioEfetivo,
  });

  double get distanciaSisTotal => pontoTransmissora - pontoReceptora;

  SistemaModel copyWith({
    double? frequencia,
    double? alturaTransmissora,
    double? alturaReceptora,
    double? pontoReceptora,
    double? pontoTransmissora,
    double? raioEfetivo,
  }) {
    return SistemaModel(
      frequencia: frequencia ?? this.frequencia,
      alturaTransmissora: alturaTransmissora ?? this.alturaTransmissora,
      alturaReceptora: alturaReceptora ?? this.alturaReceptora,
      pontoReceptora: pontoReceptora ?? this.pontoReceptora,
      pontoTransmissora: pontoTransmissora ?? this.pontoTransmissora,
      raioEfetivo: raioEfetivo ?? this.raioEfetivo,
    );
  }

  @override
  String toString() {
    return 'SistemaModel(frequencia: $frequencia, alturaTransmissora: $alturaTransmissora, alturaReceptora: $alturaReceptora, pontoReceptora: $pontoReceptora, pontoTransmissora: $pontoTransmissora, raioEfetivo: $raioEfetivo)';
  }
}
