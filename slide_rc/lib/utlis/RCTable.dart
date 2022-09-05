import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'data.dart';

class RCTable extends StatelessWidget {
  const RCTable({
    Key? key,
    required this.size,
    required this.dataList,
    required this.infoMaxlenght,
  }) : super(key: key);

  final Size size;
  final List<Data> dataList;
  final int infoMaxlenght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height / infoMaxlenght * 5.5,
              width: size.width,
              child: CreatTable(dataList, size),
            ),
          ],
        ),
      ),
    );
  }
}

Container infoContainer(double height, double width, String text,
    Decoration decoration, BuildContext context, Size size) {
  return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0XFF8D99AE))),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: size.width / 3,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlue)),
                          onPressed: () {
                            OnPressedUpdate();
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.update),
                                Text("Güncelle"),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      width: size.width / 3,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {
                            OnPressedDelete();
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.update),
                                Text("Sil"),
                              ],
                            ),
                          )),
                    ),
                  ],
                );
              });
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ));
}

DataTable dataTable(Size size, List<Data> datalist, int index, double margin,
    BuildContext context) {
  return DataTable(
      horizontalMargin: margin,
      dataRowHeight: size.height / 17,
      headingRowHeight: size.height / 17,
      // border: TableBorder.all(color: Colors.white, width: 2),
      columns: [
        DataColumn(
          label: headerContainer(
            size.width / 3,
            datalist[index].header,
            const BoxDecoration(
                color: Color(0XFF2B2D42),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
          ),
        ),
      ],
      rows: List<DataRow>.generate(datalist[index].info.length, (currentIndex) {
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Column(
                children: [
                  infoContainer(
                      size.height / 20,
                      size.width / 3,
                      datalist[index].info[currentIndex].toString(),
                      const BoxDecoration(
                        color: Color(0XFF8D99AE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      context,
                      size),
                ],
              ),
            )
          ],
        );
      }));
}

//Button func
OnPressedDelete() {}

OnPressedUpdate() {}

Container headerContainer(double width, String text, Decoration decoration) {
  return Container(
    width: width,
    decoration: decoration,
    child: SizedBox(
      height: 35,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

CreatTable(List<Data> datalist, Size size) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: datalist.length,
    itemBuilder: (
      BuildContext context,
      int index,
    ) {
      return Container(
        height: size.height / datalist.length * 2.7,
        //  width: size.width / 2,
        child: dataTable(size, datalist, index, 2, context),
      );
    },
  );
}
