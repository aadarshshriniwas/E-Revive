import 'package:e_revive_app/common/widgets/bottom_bar.dart';
import 'package:e_revive_app/features/Map/map_screen.dart';
import 'package:e_revive_app/features/auth/screens/auth_screen.dart';
import 'package:e_revive_app/features/home/screens/home_screen.dart';
import 'package:e_revive_app/features/home/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_revive_app/features/Category/small.dart';
import 'package:e_revive_app/features/Category/mobiles.dart';
import 'package:e_revive_app/features/Category/industry.dart';
Route<dynamic> generateRoute(RouteSettings routeSettings)
{
  switch(routeSettings.name)
  {

    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const BottomBar(),
      );
    case InfoScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>InfoScreen(),
      );
    case MapPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>MapPage(),
      );
    case Small.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>Small(),
      );
    case Mobile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>Mobile(),
      );
    case Industry.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>Industry(),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>const Scaffold(
        body: Center(
          child: Text("Screen not exist"),
        ),
      ),
      );
  }
}

