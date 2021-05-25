
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_apps/tabPage/decouvrirPage.dart';
import 'package:movie_apps/tabPage/tendancesPage.dart';





class Home extends StatefulWidget {



  static const int nombre_page = 2 ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //   statusBarColor: Colors.yellow
        statusBarColor: Colors.orange
    ));
    _portraitModeOnly();

    // TODO: implement initState
    super.initState();
  }

  void _portraitModeOnly() {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final  StatefulWidget tendace=  TendancesPage();
  final StatefulWidget  decouvrir=  DecouvrirPage ();


  @override
  Widget build(BuildContext context) {



    return  Scaffold(

      backgroundColor: Colors.orange,

        body: DefaultTabController(
          length: Home.nombre_page,
          child: Scaffold(
            backgroundColor: Colors.orange,
            appBar: AppBar(

                centerTitle: true,
                backgroundColor: Colors.orange,
                elevation: 0.0,
                shadowColor: Colors.black,
                iconTheme: IconTheme.of(context),

              bottom: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0),
                    insets: EdgeInsets.symmetric(horizontal:60.0)
                ),
                automaticIndicatorColorAdjustment: true,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                tabs: [
                  Tab(child: Text(tab_option[0], style: TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis,) ,),
                  Tab(child: Text(tab_option[1], style: TextStyle( fontSize: 18), overflow: TextOverflow.ellipsis,) ,),

                ],
              ),
            ),

            body: Container(

              margin: EdgeInsets.only(top: 25.0),
              decoration: BoxDecoration (
                 color: Colors.black,

                borderRadius: BorderRadius.only (
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),

              ) ,
              child: TabBarView(
                children: [
                  tendace,
                  decouvrir
                ],
              ),
            ),

          ),
        )

    );
  }

  // Tab Option
  List<String> tab_option = [
    "Tendances",
    "Découvrir",

  ];
}
