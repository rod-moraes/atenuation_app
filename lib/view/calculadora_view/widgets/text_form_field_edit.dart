import 'package:atenuation_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class TextFormFieldEdit extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String suffix;
  final bool isRequired;
  final Function(double?) onSaved;

  final Function(double?)? onChanged;
  final String initialValue;

  const TextFormFieldEdit({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.suffix,
    required this.onSaved,
    this.initialValue = '',
    this.isRequired = true,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextFormFieldEdit> createState() => _TextFormFieldEditState();
}

class _TextFormFieldEditState extends State<TextFormFieldEdit> {
  final _fieldKey = GlobalKey<FormFieldState>();
  final TextEditingController textEditingController =
      TextEditingController(); //

  final PosInputFormatter inputFormartter = const PosInputFormatter(
    mantissaLength: 2,
    thousandsSeparator: ThousandsPosSeparator.dot,
    decimalSeparator: DecimalPosSeparator.comma,
  );
  @override
  void initState() {
    if (widget.initialValue != '') {
      TextEditingValue initValue = inputFormartter.formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: widget.initialValue));
      textEditingController.value = initValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fieldKey,
      controller: textEditingController,
      inputFormatters: [
        inputFormartter,
      ],
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Utilities.colorSecondary),
        suffix: Text(widget.suffix),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Utilities.colorSecondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Utilities.colorSecondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      maxLines: 1,
      onChanged: (value) {
        if (_fieldKey.currentState != null && _fieldKey.currentState!.isValid)
          _fieldKey.currentState!.validate();

        double? valorFinal;
        if (value != null) value = value.replaceAll(".", '');
        if (value != null) value = value.replaceAll(",", '.');
        if (value != null && value.isNotEmpty) valorFinal = double.parse(value);
        if (widget.onChanged != null) widget.onChanged!(valorFinal);
      },
      onSaved: (String? value) {
        double? valorFinal;
        if (value != null) value = value.replaceAll(".", '');
        if (value != null) value = value.replaceAll(",", '.');
        if (value != null && value.isNotEmpty) valorFinal = double.parse(value);
        widget.onSaved(valorFinal);
      },
      validator: (String? value) {
        if (!widget.isRequired) return null;
        return (value != null && value.isEmpty)
            ? 'Este campo é obrigatório'
            : null;
      },
    );
  }
}
