import 'dart:convert';

import 'package:app1/models/Catalog.dart';
import 'package:app1/widgets/drawar/homeDrawar.dart';
import 'package:app1/widgets/society/SocietyListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> items = List<String>();

  @override
  void initState() {
    super.initState();
    loadSocieties();
  }

  loadSocieties() async {
    final response = await http.get(Uri.parse(
        dotenv.env['BASE_URL']! + dotenv.env['SOCIETIES_LIST_GET_END_POINT']!));
    if (response.statusCode == 200) {
      // setSocietiesInState(response.body);

      final decodedData = jsonDecode(response.body);
      final catalog = Provider.of<Catalog>(context, listen: false);
      catalog.setSocietyList(decodedData);
      

      // if(mounted){
      // setState(() {});

      // }
    } else {
      throw ("some arbitrary error");
    }
  }

  // setSocietiesInState(String value) {
  //   final decodedData = jsonDecode(value);
  //   Catalog.items = List.from(decodedData)
  //       .map<SocietyInfoItemModel>((item) => SocietyInfoItemModel.fromMap(item))
  //       .toList();
  //   // if(mounted){
  //     setState(() =>Catalog.items);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    final catalog = Provider.of<Catalog>(context);
    var bar = dotenv.env['APP_TITLE'];
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kBgLightColor,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // foregroundColor: Colors.white,
        // shadowColor: Colors.amberAccent,
        title: Text("Home $bar"),
      ),
      drawer: HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.alarm),
          ),
          BottomNavigationBarItem(
            label: "Water",
            icon: Icon(Icons.water),
          ),
        ],
      ),
      body: catalog.items.isNotEmpty
          ? ListView.builder(
              itemCount: catalog.items.length,
              itemBuilder: (context, index) =>
                  SocietyListItemWidget(item: catalog.items[index]),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
//     final emailField = TextField(
//       obscureText: false,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Email",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );
//     final passwordField = TextField(
//       obscureText: true,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Password",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );
//     final loginButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Color(0xff01A0C7),
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () {},
//         child: Text("Login",
//             textAlign: TextAlign.center,
//             style: style.copyWith(
//                 color: Colors.white, fontWeight: FontWeight.bold)),
//       ),
//     );

//     return Container(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(36.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 30.0,
//               // child: Image.asset(
//               //   "assets/logo.png",
//               //   fit: BoxFit.contain,
//               // ),
//               child: Icon(
//                 Icons.g_mobiledata,
//                 size: 20,
//               ),
//             ),
//             SizedBox(height: 45.0),
//             emailField,
//             SizedBox(height: 25.0),
//             passwordField,
//             SizedBox(
//               height: 35.0,
//             ),
//             loginButon,
//             SizedBox(
//               height: 15.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SideMenu extends StatelessWidget {
//   const SideMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
//       color: Theme.of(context).canvasColor,
//       child: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     size: 20,
//                   ),
//                   Spacer(),
//                   // We don't want to show this close button on Desktop mood
//                   if (!Responsive.isDesktop(context)) CloseButton(),
//                 ],
//               ),
//               SizedBox(height: kDefaultPadding),
//               SizedBox(height: kDefaultPadding),
//               SizedBox(height: kDefaultPadding * 2),
//               // // Menu Items
//               // SideMenuItem(
//               //   press: () {},
//               //   title: "Inbox",
//               //   iconSrc: "assets/Icons/Inbox.svg",
//               //   isActive: true,
//               //   itemCount: 3,
//               // ),
//               // SideMenuItem(
//               //   press: () {},
//               //   title: "Sent",
//               //   iconSrc: "assets/Icons/Send.svg",
//               //   isActive: false,
//               // ),
//               // SideMenuItem(
//               //   press: () {},
//               //   title: "Drafts",
//               //   iconSrc: "assets/Icons/File.svg",
//               //   isActive: false,
//               // ),
//               // SideMenuItem(
//               //   press: () {},
//               //   title: "Deleted",
//               //   iconSrc: "assets/Icons/Trash.svg",
//               //   isActive: false,
//               //   showBorder: false,
//               // ),

//               // SizedBox(height: kDefaultPadding * 2),
//               // // Tags
//               // Tags(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
