import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWaktu extends StatelessWidget {
  const InputWaktu({
    Key key,
    @required this.etWaktu,
  }) : super(key: key);

  final TextEditingController etWaktu;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etWaktu,
      decoration: const InputDecoration(hintText: "Masukan Waktu dalam Menit"),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}