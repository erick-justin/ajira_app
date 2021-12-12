
import 'package:ajira_app/utilities/colors.dart';
import 'package:ajira_app/utilities/web_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobPage extends StatefulWidget{
  var job;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState


    return JobPageState(job);
  }

  JobPage(this.job);

}


class JobPageState extends State<JobPage>{
  var job;

  JobPageState(this.job);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(

    body:  WebViewWidget(job),

      appBar: AppBar(
        title: Text("${job['title']}"),
         backgroundColor: appPrimaryColor,

      ),

    floatingActionButton: FloatingActionButton(
       onPressed: (){

       },
       child: Icon(
          Icons.share
       ),
    ),

  );
  }

}