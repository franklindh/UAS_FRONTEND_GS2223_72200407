import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getPhoto extends StatefulWidget {
  const getPhoto({Key? key}) : super(key: key);

  @override
  State<getPhoto> createState() => _getPhotoState();
}

class _getPhotoState extends State<getPhoto> {
  List _get = [];

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      body: RefreshIndicator(
        onRefresh: _getData,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(_get[index]['id'].toString()),
                  subtitle: Text(_get[index]['title']),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_get[index]['url']),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
