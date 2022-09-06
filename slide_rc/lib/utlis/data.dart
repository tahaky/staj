// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Data extends Object {
  var time;
  var sure;
  var ates;
  var nabiz;
  var tansiyon;
  var deger1;
  var deger2;

  Data(
      {required this.time,
      required this.sure,
      required this.ates,
      required this.nabiz,
      required this.tansiyon,
      required this.deger1,
      required this.deger2});

  // ignore: non_constant_identifier_names
  factory Data.map(var time, var sure, var ates, var nabiz, var tansiyon,
      var deger1, var deger2) {
    return Data(
        time: time,
        sure: sure,
        ates: ates,
        nabiz: nabiz,
        tansiyon: tansiyon,
        deger1: deger1,
        deger2: deger2);
  }
  Map<String, dynamic> toMap() {
    var Data = Map<String, dynamic>();

    Data['time'] = time;
    Data['sure'] = sure;
    Data['ates'] = ates;
    Data['nabiz'] = nabiz;
    Data['tansiyon'] = tansiyon;
    Data['deger1'] = deger1;
    Data['deger2'] = deger2;

    return Data;
  }

  Data.fromRefMap(dynamic setRef) {
    time = setRef["time"];
    sure = setRef["sure"];
    ates = setRef["ates"];
    nabiz = setRef["nabiz"];
    tansiyon = setRef["tansiyon"];
    deger1 = setRef["deger1"];
    deger2 = setRef["deger2"];
  }
}
