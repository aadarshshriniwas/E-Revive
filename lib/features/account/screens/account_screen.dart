import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
            Container(
              alignment: Alignment.topLeft,
              child: Text("E-Revive",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w400),),
            ),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 15),
                  child:Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search),

                    ],
                  ),
              )
            ],
          ),
        ),

      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
