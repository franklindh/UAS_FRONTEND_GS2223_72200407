import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_frontend_gs2223_72200407/comments.dart';
import 'package:uas_frontend_gs2223_72200407/photos.dart';
import 'package:uas_frontend_gs2223_72200407/posts.dart';
import 'package:uas_frontend_gs2223_72200407/users.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/logo.png")),
                accountName: Text("72200407"),
                accountEmail: Text("Franklin David Hengkengbala")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Post'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getPost()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home_repair_service),
              title: Text('Comment'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getComment()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Photo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getPhoto()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getUser()),
                );
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          buildContainer(),
          // buildCard(context)
        ],
      ),
    );
  }

  // Card buildCard(BuildContext context) {
  //   return Card(
  //     elevation: 8,
  //     child: Column(
  //       children: [
  //         ListTile(
  //           leading: Icon(Icons.home),
  //           title: Text('Pertemuan 1'),
  //           subtitle: Text('Pertemuan 1'),
  //           trailing: Icon(Icons.arrow_forward_ios),
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //         Row(
  //           children: [
  //             TextButton(
  //               onPressed: () {},
  //               child: Text('Button 1'),
  //             ),
  //             TextButton(
  //               onPressed: () {},
  //               child: Text('Button 2'),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Container buildContainer() {
    return Container(
      child: Text('UAS'),
      padding: EdgeInsets.all(0.0),
    );
  }
}
