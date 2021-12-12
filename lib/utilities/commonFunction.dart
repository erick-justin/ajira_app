

  import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'dart:math';



import 'package:async/async.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';







import 'colors.dart';
import 'connectionUtils.dart';
import 'dialogs.dart';


bool validateInputs(BuildContext context,List<String>inputs){
     bool valid = true;
    for (int i =0; i<inputs.length;i++){
           String input = inputs[i];
           if(input.isEmpty){
              MessageDialogs().messageDialog(context, "Alert", "Please Fill All The Fields", 3464);
              valid = false;
              break;
           }

    }
    return valid;
  }


  bool validatePhoneNumber(BuildContext context,String number){
    bool valid = true;

      if(number.length!=10 &&number.length !=12){
        print("the phone number${number.length}");
        MessageDialogs().messageDialog(context, "Alert", "Enter A valid Phone number", 3464);
        valid = false;


    }
    return valid;
  }



  void showModalBottomSheetF(BuildContext context, Widget body,{Color color=appSecondaryColor}) {
    // print(Suser_id);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(


          borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight: Radius.circular(20))),
      backgroundColor: color,

      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return  body;

      },
    );

  }



  String getCommaValue(double number)
  {
    var ss = number.toStringAsFixed(0);
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    ss = ss.replaceAllMapped(reg, (Match match) => '${match[1]},');
    return "$ss TZS";
  }


  String identifyMno(String phone_number){
   var vodacom = ['75','76','74'];
   var airtel = ['68','78','69'];
   var halotel = ['62'];
   var ttcl = ['73'];
   var tigo = ['71','65'];

   String phoneInitials = "";
   String mnoType = "";
       if (phone_number.length == 12){ 
           phoneInitials = phone_number.substring(3,5);
           print(phoneInitials);
            
       }

   if (phone_number.length == 10){
     phoneInitials = phone_number.substring(1,3);
     print(phoneInitials);
   }

   if( vodacom.contains(phoneInitials) ){
        mnoType = "vodacom";
   }

   if( airtel.contains(phoneInitials) ){
      mnoType = "airtel";
   }

   if( halotel.contains(phoneInitials) ){
          mnoType = "halotel";
   }

   if( ttcl.contains(phoneInitials) ){
       mnoType = "ttcl";

   }
   if(tigo.contains(phoneInitials) ){
       mnoType = "tigo";
   }

   return mnoType;

  }




  Widget infoText(String info){
    return Padding(
        padding: EdgeInsets.only(top: 8,bottom: 8),
        child:
        Text(

          info, style: TextStyle(
            color: Colors.black,fontSize: 15
        ),textAlign: TextAlign.center,
        ));
  }


  Widget infoHeader(String info){
    return Padding(
        padding: EdgeInsets.only(top: 8,bottom: 8),
        child:Text(
          info, style: TextStyle(
            color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
        ),textAlign: TextAlign.center,
        ));
  }











































  class Precache {
 BuildContext context;
 static List dd = [];
  Precache(this.context){
    var t =AssetImage("Assets/tigopesa.png");
    precacheImage(t, context);
    var a = AssetImage("Assets/airtelmoney.png");
    precacheImage(a, context);
    var v =AssetImage("Assets/mpesa.png");
    precacheImage(v, context);
    var h = AssetImage("Assets/halopesa.png");
    precacheImage(h, context);
    var p = AssetImage("Assets/tpesa.png");
    precacheImage(p, context);
    var c = AssetImage("Assets/card.png");
    precacheImage(c, context);

    dd.add(t);
    dd.add(a);
    dd.add(v);
    dd.add(h);
    dd.add(p);
    dd.add(c);
  }




}




