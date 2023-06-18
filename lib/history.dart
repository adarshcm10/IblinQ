import 'package:flutter/material.dart';

import 'var.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //in appbar on left side, a home icon that pop the screen
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.arrow_back,
            //height 30
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        //background colour black
        backgroundColor: Colors.black,
      ),
      //background colour black
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //text in logo's font 'History'
            const Center(
              child: Text(
                'History',
                //align text to center
                //textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Moirai one',
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(
                      label: Text(
                    'Date',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Time From',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Time To',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                rows: List.generate(
                  ShareData.history.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(
                        ShareData.history[index][0],
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        ShareData.history[index][1],
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        ShareData.history[index][2],
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
