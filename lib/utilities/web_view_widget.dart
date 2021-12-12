


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'colors.dart';




class WebViewWidget extends StatelessWidget{
  var article;


  WebViewWidget(this.article);
  String dd = '"<p>Siku chache baada ya mmiliki na muanzilishi wa mtandao wa Twitter,bilionea Jack Dorsey atangaze kwamba makao makuu ya mtandao wa Twitter barani Africa yanaenda kuwa nchini Ghana Hatimae mmiliki huyo wa mtandao huo amesema ataenda kukaa nchini Ghana kwa miezi 6 akisimamia uanzishwaji wa makao hayo makuu Ghana huku akijifunza mambo mbalimbali barani Africa.</p>\n<p><img src=\"https://i.gadgets360cdn.com/large/jack_dorsey_reuters_full_1556094427419.JPG?downsize=950:*&amp;output-quality=80\" alt=\"\" width=\"950\" height=\"534\" /><br /><br />Muanzilishi huyu wa Twitter, Jack Dorsey Anautajiri Wa Dola Bilioni 13.5 Hivyo Kama Angekuwa Ni Raia Wa Africa Basi Angekua Ndiye Bilionea Namba 1 Barani Africa Na Angefuatiwa Na Bilionea Aliko Dangote Mwenye Utajiri Wa Dola Bilioni 11.4 Kwa Sasa<br /><br />Ndoto ya Bilionea huyu kuja kukaa Africa haikuza mwaka huu, mwaka jana aliahidi angekuja kukaa Africa kwa miezi kadhaa lakini janga la Corona lilifelisha ndoto yake hiyo.<br /><br />Baada ya bilionea Jack kutangaza atakaa nchini Ghana kwa miezi tayari marafiki zake kadhaa ambao ni matajiri wakubwa na watu mashuhuri duniani wameahidi kuungana nae katika safari hii.<br /><br />Kwa mujibu wa bilionea huyu anasema kitu pekee kilichowafanya waamue kuweka makao makuu ya Twitter barani Africa nchini Ghana ni kutokana na kwamba nchi ya Ghana inajali sana demokrasia na uhuru wa vyombo vya habari ni wali ya juu sana ukizingatia hata mtandao wa Twitter ni mtandao unaotoa nafasi kwa watu kujieleza.<br /><br />Ziko Faida mbalimbali ambazo Ghana itapata kutokana na makao makuu ya Twitter Africa kuwa nchini kwao zikiwemo kupata kodi kutoka mtandao wa Twitter kwa shughuli za Twitter nchini Ghana hivyo wameongeza mlipa kodi mkubwa, lakini pia ajira mbalimbali tayari zimetangazwa kwa wananchi wa Ghana wanaotaka na kukidhi vigezo vya kuajiriwa na mtandao wa Twitter.<br /><br />Lakini pia tukio la muanzilishi wa mtandao huo kukaa Ghana miezi 6 linaiweka Ghana kwenye jicho kubwa sana duniani huku mabilionea, wawekezaji na watu mbalimbali duniani wakijaribu kuangalia ni fursa gani wanaweza kuwekeza Ghana kutokana na muanzilishi wa Twitter kuichagua Ghana kuwa makao makuu ya Twitter Africa na sio nchi zingine 53 barani Africa.<br /><br />Kumbuka Kuelekea Siku Ya Kina Mama Duniani'
      ' <a href=\"tg://search_hashtag?hashtag=MothersDay\">#MothersDay</a> Ukinunua Bidhaa Kwenye App Ya Swahilies Unapata Bidhaa Na Unapata Zawadi Ya Kumpa Mama'
      ' <a href=\"tg://search_hashtag?hashtag=ZawadiKwaBimkubwa\">'
      '#ZawadiKwaBimkubwa</a> Kwenye Siku Ya Kina Kama Duniani <a href=\"tg://'
      'search_hashtag?hashtag=MothersDay\">#MothersDay</a>&nbsp;</p>';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Container(

      padding: EdgeInsets.all(16),
      //color: appDeemBlackColor,
      child:
      ListView(
        children: [
          // Align(
          //   alignment: Alignment.topRight,
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.pop(context);
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Icon(
          //         Icons.clear,
          //         color: appPrimaryColor,
          //         size: 50,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
                color: appPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text("Apply Now",style: TextStyle(
                    fontSize: 34,
                    color: Colors.white
                ),),
              ),
            ),
          ),
          Html(data:article['content']['rendered'],style: {
            "*":Style(
                color: Colors.black
            )
          },),
          Container(
            decoration: BoxDecoration(
               color: appPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
             child: Padding(
               padding: const EdgeInsets.all(32.0),
               child: Center(
                 child: Text("Apply Now",style: TextStyle(
                   fontSize: 34,
                    color: Colors.white
                 ),),
               ),
             ),
          )
        ],
      ),
    );

  }
}

