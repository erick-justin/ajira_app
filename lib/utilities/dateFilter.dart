//class dateFile

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

class DateFilter {
  String _sDate = "Start Date";
  String _endDate = "End Date";

  Widget dateView() {
    return DateWidget(this._sDate, this._endDate);
  }

  String get endDate => _endDate;

  String get sDate => _sDate;
}

// ignore: must_be_immutable
class DateWidget extends StatefulWidget {
  String? sDate;
  String? eDate;
  State? someSatae;

  DateWidget(this.sDate, this.eDate);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DateState();
  }
}

class DateState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return theView();
  }

  Widget theView() {
    return Container(
      height: 200,
      width: 300,
      child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16),
              child: InkWell(
                child: Card(
                  shape: new RoundedRectangleBorder(
                      side: new BorderSide(color: appSecondaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 5,
                  color: appSecondaryColor,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      widget.sDate!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                onTap: () {
                  _selectDate(400);
                },
              )),
          Padding(
              padding: EdgeInsets.all(16),
              child: InkWell(
                child: Card(
                  shape: new RoundedRectangleBorder(
                      side: new BorderSide(color: appSecondaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 5,
                  color: appSecondaryColor,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      widget.eDate!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                onTap: () {
                  _selectDate(600);
                },
              ))
        ],
      ),
    );
  }

  Future _selectDate(int code) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2200));
    if (picked != null) {
      setState(() {
        if (code == 400) {
          widget.sDate = new DateFormat("yyyy-MM-dd").format(picked);
        }

        if (code == 600) {
          widget.eDate = new DateFormat("yyyy-MM-dd").format(picked);
        }
      });

      print(widget.sDate);
      print(widget.eDate);
    }
  }
}

String getStartDate() {
  var date = new DateTime.now();
  return new DateFormat("yyyy-MM-dd").format(date.subtract(Duration(days: 30)));
}
