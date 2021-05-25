import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:movie_apps/ui/splash.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {

    super.initState();

    // changeStatusColor(Colors.red);

    // Change Status Bar Colors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   statusBarColor: Colors.yellow
        statusBarColor: Colors.black45
    ));

  }


  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      initialRoute: '/',
      routes: {

        '/': (context) =>Splash(),

        // Home page
       //  Routes.liste_cartegoris_PageScreen: (context) => Custom_Liste_cartegoris_PageScreen(),


      },

      builder:  (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [



            //  Default
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),


          ],
         // background: Container(color: Color(0xFFF5F5F5))),
          background: Container(color: Colors.black)),

      title: 'Movi',
      theme: ThemeData(
        //  primarySwatch: Colors.blue,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,
      //  home: MyHomePage( ),
    );
  }

/*

  changeStatusColor(Color color) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      if (useWhiteForeground(color)) {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
        //  _useWhiteStatusBarForeground = true;
        //   _useWhiteNavigationBarForeground = true;
      } else {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
        //  _useWhiteStatusBarForeground = false;
        //  _useWhiteNavigationBarForeground = false;
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }


 */
}

