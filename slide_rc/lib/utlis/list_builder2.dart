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
    late List<dynamic> infoList = [
      'merhaba1',
      'nasilsiniz2',
      'tesekurler3',
      'merhaba1',
      'nasilsiniz2',
      'tesekurler3',
      'nasilsiniz2',
    ];
    late List<dynamic> infoList2 = [
      'merhaba4',
      'nasilsiniz5',
      'tesekurler6',
      'merhaba1',
      'nasilsiniz2',
      'tesekurler3',
      2,
      "66550",
      "5955959"
          "52a3sdas6d"
    ];

    late Data data = Data("header1", infoList);
    late Data data2 = Data("header2", infoList2);
    late Data data3 = Data("header3", infoList);
    late Data data4 = Data("header4", infoList);
    late Data data5 = Data("header5", infoList);

    late List<Data> dataList = [data, data2, data3, data4, data5];
    Size size = MediaQuery.of(context).size;
    int infoMaxLenght = 0;
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 56, 182),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: size.height / 3,
            width: size.width / 1.1,
            child: RCTable(
              size: size,
              dataList: dataList,
              infoMaxlenght: 9,
            ),
          ),
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

int getInfoLenght(List<Data> dataList) {
  int max = dataList[0].info.length;
  for (int i = 0; i < dataList.length; i++) {
    for (int j = 0; j < dataList[i].info[j]; j++) {
      if (dataList[i].info[j] > max) {
        max = dataList[i].info[j];
      }
    }
  }
  print(max);
  return max;
}
