import 'package:flutter/material.dart';
import 'package:kuis1_konversi_kalori/inputwaktu.dart';
import 'input.dart';
import 'inputwaktu.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayat.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etBerat = new TextEditingController();
  TextEditingController etWaktu = new TextEditingController();

  double nBerat = 0;
  double nWaktu = 0;
  String _newValue = "Ringan";
  double _result = 0;
  List<String> listViewItem = [];

  void _konversiCalori() {
    setState(() {
      nBerat = double.parse(etBerat.text);
      nWaktu = double.parse(etWaktu.text);
      if (_newValue == "Ringan")
        _result = nBerat * (nWaktu/60) * 3;
      else if (_newValue == "Sedang")
        _result = nBerat * (nWaktu/60) * 5;
      else
        _result = nBerat * (nWaktu/60) * 10;
      listViewItem.add("$_newValue : $_result");
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
    _konversiCalori();
  }

  var listString = [
    "Ringan",
    "Sedang",
    "Berat",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kalkulator Pembuangan Kalori Kegiatan"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Text("Masukkan Berat Badan Anda"),
                  Input(etBerat: etBerat),
                ],
              ),
              Column(
                children: [
                  Text("Masukkan Lama Kegiatan Anda dalam"),
                  InputWaktu(etWaktu: etWaktu),
                ],
              ),
              
              Dropdown(
                listView: listString,
                newValue: _newValue,
                newMethod: dropdownOnChanged,
              ),
              Result(
                result: _result,
              ),
              Convert(konvertHandler: _konversiCalori),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}