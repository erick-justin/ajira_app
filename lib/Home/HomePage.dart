

import 'dart:convert';
import 'dart:math';

import 'package:ajira_app/Home/job_page.dart';
import 'package:ajira_app/utilities/colors.dart';
import 'package:ajira_app/utilities/commonFunction.dart';
import 'package:ajira_app/utilities/connectionUtils.dart';
import 'package:ajira_app/utilities/dialogs.dart';
import 'package:ajira_app/utilities/sizeConfig.dart';
import 'package:ajira_app/utilities/systemConstants.dart';
import 'package:ajira_app/utilities/timeFuction.dart';
import 'package:ajira_app/utilities/web_view_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  return HomePageState();
  }

}


class HomePageState extends State<HomePage>{
  bool hasDoneLoading = false;
  List jobs = [];

  @override
  void initState() {
    // TODO: implement initState
  getServerResponse("requestJsonString", 100, false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


   return Scaffold(

     body:  theBody(),

   );
  }

  Widget theBody(){
    return
        Column(
           children: [
             Expanded(
               flex: 1,
               child:  Text(
                 "",
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 30
                 )
                 ,
               ),),
             Expanded(
               flex: 2,
               child:  Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                 "Jobs For You",
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 30
                 )
                 ,
             ),
               ),),

             Expanded(
               flex: 3,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              fontSize: 13,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              hintText: "Search Job...",
                              filled: true,
                              fillColor: Colors.white30,
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                    15.0),
                                borderSide: new BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(
                                    15.0),
                                borderSide: new BorderSide(
                                    color:Colors.black, width: 1.0),
                              ),

                            ),
                            onChanged: (t){
                            //  _debouncer.run(() {
                             //   _updateSearchTerm(t);
                            //  });

                            },
                          ),
                        ),

                        InkWell(
                          onTap: (){
                             showModalBottomSheetF(context, theCategoryList(),color: appPrimaryColor);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                     color: Colors.redAccent,

                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Icon(
                     Icons.addchart_rounded,
                    size: 40,
                    color: Colors.white,
                ),
                            ),
                          ),
                        )
                      ],
                   ),
                 )),
             Expanded(
               flex: 15,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: Text("Latest Job Offers"),
                     ),
                     Expanded(
                        // flex: 8,
                         child: hasDoneLoading
                             ? jobs.isNotEmpty
                             ? ListView.builder(
                             itemCount: jobs.length,
                             itemBuilder: (context, index) {
                               var consult = jobs[index];
                               return    requestView(consult);
                             })
                             : Center(
                           child: Text("You have No Feeds"),
                         )
                             : Center(
                           child: CircularProgressIndicator(),
                         )),
                   ],
                //
             ))
           ],
        );
  }

  Widget requestView(consultation) {
    DateTime dateTime = DateTime.parse(consultation['date']);
    //String month = new DateFormat("MMM").format(dateTime);
    //  String time = new DateFormat("Hm").format(dateTime);

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: InkWell(
          child: Container(

            padding: EdgeInsets.all(8),
            height: 125,
            decoration: new BoxDecoration(
              //color: appPrimaryColor,
               // borderRadius: BorderRadius.circular(15.0)
             // border: Border(
               //  bottom: BorderSide(
                   // color: Colors.black,
                 //  width: 1
                 )

            ,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Container(
                    width: 70,
                    height: 70,






                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),
                            bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20) )

                    ),
                    child: ClipRRect(

                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),
                            bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Container(
                                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              ),

                          imageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzzVNuceVZug1JpFuUgwj37HiHsmyvN6gd9w&usqp=CAU",
                          //['cover_image'].replaceAll("https://cargoway-main.s3.us-east-1.amazonaws.com", "https://d3guu15xcnq900.cloudfront.net"),
                          errorWidget:(_,p,c) =>
                              Container(
                                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              ),
                          fit: BoxFit.cover,


                        )
                    )),
              ),

SizedBox(
   width: 10,
),
              Expanded(

                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start
                        ,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            //  color: appPrimaryColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(consultation['title']['rendered'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  )),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  TimeFunction().getTimeElapsed(consultation['date']),
                                  style: TextStyle(
                                    fontSize: 11,

                                    color: Colors.black,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ))
            ]),
          ),
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>JobPage(consultation))); // ,WebViewWidget(consultation),color: Colors.white);
          }
          // Navigator.push(context, MaterialPageRoute(builder: (mContext)=>OderView(order)));
          ,
        ));
  }
 String? category_name;
  Widget theCategoryList() {
    var dd = [
      {"name": "Engineer"},
      {"name": "Doctors"},
      {"name": "Cooperate"},
      {"name": "Part time"},
      {"name": "Skilled"},
      {"name": "IT"}
    ];
    return ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        children: dd
            .map((e) => InkWell(
          onTap: () {
            setState(() {
             category_name = e['name']!;
            });
            Navigator.pop(context);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        e['name']!,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ))
            .toList());
  }






  Future<void> getServerResponse (String requestJsonString,int rCode, bool hasLoading) async {
    if (hasLoading){
      MessageDialogs().loadingIndicator(context);}
    String serverResponse = await  ConnectionUtils(context).createPost("http://3.144.199.171/wp-json/wp/v2/posts", requestJsonString, hasLoading);
    if (hasLoading){
      MessageDialogs().dismissDialogs(context);}
    print(serverResponse);
    if (serverResponse != null) {
      var responseBody = jsonDecode(serverResponse);


        if(rCode == 100) {


          setState(() {

            jobs = responseBody;
            hasDoneLoading = true;
          });

        }

        if( rCode == 200){
          setState(() {
            //posts = JsonExtraction().extractPostFromJson(serverResponse);
          });
          // MessageDialogs().messageDialog(context, "Success", responseBody['msg'], 432);
        }

        if(rCode == 300){

        }

        if(rCode == 400){

        }




    }


  }
}

