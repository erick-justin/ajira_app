import 'dart:async';
import 'dart:convert';

import 'package:ajira_app/Home/HomePage.dart';
import 'package:ajira_app/utilities/colors.dart';
import 'package:ajira_app/utilities/connectionUtils.dart';
import 'package:ajira_app/utilities/dialogs.dart';
import 'package:ajira_app/utilities/fade_transition.dart';
import 'package:ajira_app/utilities/sizeConfig.dart';
import 'package:ajira_app/utilities/systemConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';



Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    //  MultiProvider(
   // child:
    TheBase(),
   // providers: [
     // ChangeNotifierProvider(create: (context) => ChatNotifier()),
     // ChangeNotifierProvider(create: (context)=>AgoraNotifier(),)
   // ],
  //)
  );
}

String Suser_id = "";
String Sphone_number = "";
String Semail = "";
String Sname = " ";
String Sprofile_photo = "";
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TheBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ajira App',
      theme: ThemeData(
        // bottomSheetTheme: BottomSheetThemeData(
        // backgroundColor: appPrimaryColor.withOpacity(0.1)),
        // This is the theme of your application.
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Precache imch;
class _MyHomePageState extends State<MyHomePage> {
  initiateFireAbse() {
    //  PushNotificationsManager manager = PushNotificationsManager();
    // manager.init();
    // manager.firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     //_showItemDialog(message);
    //   },
    // );
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    initiateFireAbse();
    // imch =
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    // Precache(context);

    // Swidth =SizeConfig.screenWidth;
    // Sheight = SizeConfig.screenHeight;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.black,
              child: Center(
                child: GradientText(
                  'DubaiJobs',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String token = "";
  bool status = false;

  void startTimer() {
    bool logged = false;

    //getServerResponse(trackPointJson(), 400, false);
    new Timer(Duration(milliseconds: 2000), () async {
      // Navigator.push(context, FadeRoute(page: OnBoardingPage()));
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // if (preferences.getBool("logged") != null) {
      //   logged = preferences.getBool("logged")!;
      //   if (logged) {
      //     Suser_id = preferences.getString('user_id')!;
      //     Sphone_number = preferences.getString('phone_number')!;
      //     Sname = preferences.getString('user_name')!;
      //     //token = preferences.getString("token")!;
      //     getServerResponse(trackPointJson(), 100, false);
      //     //  Navigator.push(context, FadeRoute(page: EventsHome()));
      //    // Navigator.push(context, FadeRoute(page: LoginPage()));
      //   } else {
       //   Navigator.push(context, FadeRoute(page: LoginPage()));
          Navigator.push(context, FadeRoute(page: HomePage()));
      //   }
      // } else {
      //   // Navigator.push(context, FadeRoute(page: OnBoardingPage()));
      //   Navigator.push(context, FadeRoute(page: HomePage()));
      //   // Navigator.push(mContext, MaterialPageRoute(builder: (mContext) => IntroPage()));
      // }
    });
  }

  Future<void> getServerResponse(String requestJsonString, int rCode, bool hasLoading) async {
    if (hasLoading) {
      MessageDialogs().loadingIndicator(context);
    }
    String serverResponse = await ConnectionUtils(context).createPost(serverUrl, requestJsonString, hasLoading);
    if (hasLoading) {
      MessageDialogs().dismissDialogs(context);
    }

    var responseBody = jsonDecode(serverResponse);
    int code = responseBody['code'];
    if (code == 200) {
      print(code);
      if (rCode == 100) {}

      if (rCode == 200) {
        status = responseBody['status'];
        print(status);
      }
    } else if (code == 300) {
    } else {
      MessageDialogs().messageDialog(context, "Error!", responseBody['msg'], 54);
    }
  }

  String trackPointJson() {
    Map<String, dynamic> request = new Map();
    Map<String, dynamic> data = new Map();

    request['code'] = 131;
    request['api'] = 100;
    data['user_id'] = Suser_id;
    data['firebase_token'] = token;
    request['data'] = data;

    print(jsonEncode(request));
    return jsonEncode(request);
  }

  String checkAppVersion() {
    Map<String, dynamic> request = new Map();
    Map<String, dynamic> data = new Map();

    request['code'] = 129;
    request['api'] = 100;
    request['app_version'] = "1.0";

    print(jsonEncode(request));
    return jsonEncode(request);
  }
}
