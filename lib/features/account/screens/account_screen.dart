import 'package:flutter/material.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:gradient_widgets/gradient_widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:e_revive_app/providers/user_provider.dart';
// import '../../../constants/global_variables.dart';
// import 'package:provider/provider.dart';
import 'package:e_revive_app/features/home/services/info_services.dart';
import 'package:e_revive_app/features/account/screens/profile_menu.dart';
import 'package:e_revive_app/features/account/screens/profile_pic.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int supercoinBalance = 128;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          SizedBox(height: 60,),
          ProfilePic(),
          SizedBox(height: 20),
          SupercoinsBox(supercoinBalance: supercoinBalance), // Add the SupercoinsBox here
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/pngegg (18).png",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/pngegg (19).png",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/pngegg (20).png",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/pngegg (21).png",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/pngegg(22).png",
            press: () {
              AccountServices().logOut(context);
            },
          ),
          SizedBox(height: 50,),
          Text("Team E_Revive",style: TextStyle(fontSize:15,fontWeight: FontWeight.w300),),
        ],
      ),
    );
  }
}
class SupercoinsBox extends StatelessWidget {
  final int supercoinBalance; // Pass the user's supercoin balance here

  SupercoinsBox({required this.supercoinBalance});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Customize the box color
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star, // You can use any icon representing supercoins
            color: Colors.yellow, // Customize the icon color
          ),
          SizedBox(width: 5),
          Text(
            'Supercoins: $supercoinBalance', // Display the supercoin balance here
            style: TextStyle(
              color: Colors.white, // Customize the text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}