
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final String imageUrl =
      'https://scontent.fdel15-1.fna.fbcdn.net/v/t31.18172-8/17990388_1417115348356293_3223022509839353952_o.jpg?_nc_cat=108&ccb=1-3&_nc_sid=174925&_nc_ohc=KBFbh4MbSeUAX9UlIvX&_nc_ht=scontent.fdel15-1.fna&oh=20904b03f424ec2a40aaf90ab1fe8b27&oe=60EB8F46';

  String _tokenId = "";
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, "/", ModalRoute.withName('/home'));
  }

  @override
  void initState() {
    super.initState();
    loadToken();
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _tokenId = (prefs.getString('token') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      semanticLabel: "Drawer",
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('vikasbek $_tokenId'),
              accountEmail: Text('vikasbek35@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              _handleLogout();

              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
