import 'package:e_revive_app/common/widgets/bottom_bar.dart';
import 'package:e_revive_app/constants/global_variables.dart';
import 'package:e_revive_app/features/auth/screens/auth_screen.dart';
import 'package:e_revive_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_revive_app/router.dart';
import 'package:e_revive_app/features/home/screens/home_screen.dart';
import 'package:e_revive_app/constants/error_handling.dart';
import 'package:e_revive_app/features/auth/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(

    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Revive App',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
