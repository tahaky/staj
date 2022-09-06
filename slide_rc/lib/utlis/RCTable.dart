// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class RCTable extends StatelessWidget {
  const RCTable({
    Key? key,
    required this.size,
    required this.objectList,
    required this.infoMaxlenght,
    required this.headerDecoration,
    required this.infoDecoration,
    required this.headerWidth,
    required this.infoWidth,
    required this.tableRowMargine,
    required this.infoRowsValueNames,
    required this.infoTextStyle,
    required this.headerTextStyle,
  }) : super(key: key);

  final Size size;
  final List<dynamic> objectList;
  final int infoMaxlenght;
  final Decoration headerDecoration;
  final Decoration infoDecoration;
  final double headerWidth;
  final double infoWidth;
  final double tableRowMargine;
  final TextStyle infoTextStyle;
  final TextStyle headerTextStyle;
  final List<dynamic> infoRowsValueNames;

  //final String sure = "sure";
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
                child: CreateTable(
                    objectList,
                    headerDecoration,
                    infoDecoration,
                    headerWidth,
                    infoWidth,
                    tableRowMargine,
                    infoTextStyle,
                    headerTextStyle,
                    infoRowsValueNames))
          ],
        ),
      ),
    );
  }
}

CreateTable(
  List<dynamic> objectList,
  Decoration headerDecoration,
  Decoration infoDecoration,
  double headerWidth,
  double infoWidth,
  double margine,
  TextStyle infoTextStyle,
  TextStyle headerTextStyle,
  List<dynamic> infoRowsValueNames,
) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    itemCount: objectList.length,
    itemBuilder: (BuildContext context, int index) {
      return dataTable(
          objectList,
          index,
          headerDecoration,
          infoDecoration,
          headerWidth,
          infoWidth,
          margine,
          headerTextStyle,
          infoTextStyle,
          infoRowsValueNames);
    },
  );
}

dataTable(
    List<dynamic> objectList,
    int currentindex,
    Decoration headerDecoration,
    Decoration infoDecoration,
    double headerWidth,
    double infoWidth,
    double margine,
    TextStyle headerTextStyle,
    TextStyle infoTextStyle,
    List<dynamic> infoRowsValueNames) {
  return DataTable(
    headingRowHeight: 50,
    columns: <DataColumn>[
      DataColumn(
          label: Row(
        children: [
          HeaderContainer(
              'Time', headerDecoration, headerWidth, headerTextStyle),
          HeaderContainer(
              'Sure', headerDecoration, headerWidth, headerTextStyle),
          HeaderContainer(
              'Ates', headerDecoration, headerWidth, headerTextStyle),
          HeaderContainer(
              'Nabiz', headerDecoration, headerWidth, headerTextStyle),
          HeaderContainer(
              'Tansiyon', headerDecoration, headerWidth, headerTextStyle),
          HeaderContainer(
              'Deger1', headerDecoration, headerWidth, headerTextStyle),
          HeaderContainer(
              'Deger2', headerDecoration, headerWidth, headerTextStyle),
        ],
      ))
    ],
    rows: List<DataRow>.generate(
      objectList.length,
      (index) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Row(
              children: [
                infoContainer(objectList[index].time.toString(), infoDecoration,
                    infoWidth, infoTextStyle),
              ],
            ))
          ],
        );
      },
    ),
  );
}

Container infoContainer(
    String infoText, Decoration decoration, double width, TextStyle textStyle) {
  return Container(
    width: width,
    decoration: decoration,
    child: Center(
      child: Text(
        infoText,
        style: textStyle,
      ),
    ),
  );
}

Container HeaderContainer(
    String infoText, Decoration decoration, double width, TextStyle textStyle) {
  return Container(
    width: width,
    decoration: decoration,
    child: Center(
      child: Text(
        infoText,
        style: textStyle,
      ),
    ),
  );
}

/*Container infoContainer(double height, double width, String text,
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
}*/

/*DataTable dataTable(Size size, List<Object> objetList, int index, double margin,
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
            objectList[index].header,
            const BoxDecoration(
                color: Color(0XFF2B2D42),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
          ),
        ),
      ],
      rows: List<DataRow>.generate(objectList[index].info.length, (currentIndex) {
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Column(
                children: [
                  infoContainer(
                      size.height / 20,
                      size.width / 3,
                      objectList[index].info[currentIndex].toString(),
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
*/
//Button func
OnPressedDelete() {}

OnPressedUpdate() {}

/*Container headerContainer(double width, String text, Decoration decoration) {
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
}*/

/*CreatTable(List<Object> objectList, Size size) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemCount: objectList.length,
    itemBuilder: (
      BuildContext context,
      int index,
    ) {
      return Container(
        height: size.height / objectList.length * 2.7,
        //  width: size.width / 2,
        child: dataTable(size, objectList, index, 2, context),
      );
    },
  );
}*/
