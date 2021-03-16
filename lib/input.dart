import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.etBerat,
  }) : super(key: key);

  final TextEditingController etBerat;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etBerat,
      decoration: const InputDecoration(hintText: "Masukan Berat dalam Kilogram"),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}