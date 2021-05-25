import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:movie_apps/Widget/bezierContainer.dart';
import 'package:movie_apps/home.dart';
import 'package:movie_apps/vaues/StringValues.dart';
import 'package:page_transition/page_transition.dart';




class Splash extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<Splash>  with TickerProviderStateMixin {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer ();
    _portraitModeOnly();

  }


  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }




  @override
  void dispose() {
    // TODO: implement
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.black,
        body: Stack (
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                    Center(
                      child: Container(
                          padding: EdgeInsets.only( bottom: 20.0),
                          child:
                          Align(alignment: Alignment.center,
                            child: Image.asset("assets/logo/logo_app.png"),)),
                    ),

                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                ],
              ),


              Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all( 20.0),
                child:
                Align(alignment: Alignment.bottomCenter,
                  child: Text( Chaines.splash_bottom_text,
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 18.0, color:  Colors.orange),
                    textAlign: TextAlign.center ,),),
              ),


              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
            ]
        )

    );
  }


  // Gestion du temps
  startTimer() async {
  //  var duration = Duration (seconds: 10);
    var duration = Duration (seconds: 5);
    return Timer (duration, route);
  }

  route() {

    setState(() {


          Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child:  Home()
              // Lunch Walk
              // if user auth = false
              // Else lunch Hom
            ),
          );

    });

  }


}
