// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:slide_rc/utlis/data.dart';

import 'RCTable.dart';

class ListBuilder extends StatefulWidget {
  ListBuilder({Key? key}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    Data data1;
    data1 = Data(
      time: 5,
      sure: 15,
      ates: 38,
      nabiz: 75,
      tansiyon: 12,
      deger1: 1,
      deger2: 2,
    );

    Data data2;
    data2 = Data(
      time: 5,
      sure: 15,
      ates: 38,
      nabiz: 75,
      tansiyon: 12,
      deger1: 1,
      deger2: 2,
    );
    Map<String, dynamic> data = data1.toMap();

    List<Data> objectList = [data1, data2];

    //Object object = <Object>[];
    Size size = MediaQuery.of(context).size;
    int infoMaxLenght = 0;
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: asdasd(size, objectList),
        ),
      ),
    );
  }

  Padding asdasd(Size size, List<dynamic> objectList) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: size.height / 3,
        width: size.width / 1.1,
        child: RCTable(
          size: size,
          objectList: [objectList],
          infoMaxlenght: objectList.length,
          headerDecoration: BoxDecoration(
            color: Color(0XFF2B2D42),
          ),
          infoDecoration: BoxDecoration(color: Color(0XFF8D99AE)),
          headerWidth: 70,
          infoWidth: 70,
          tableRowMargine: 15,
          infoRowsValueNames: [],
          headerTextStyle: TextStyle(color: Colors.white),
          infoTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

SizedBox space(Size size, double heigt) {
  return SizedBox(
    height: heigt,
    width: 0,
  );
}
