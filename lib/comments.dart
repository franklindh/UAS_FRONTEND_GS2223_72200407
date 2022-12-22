import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getComment extends StatefulWidget {
  const getComment({Key? key}) : super(key: key);

  @override
  State<getComment> createState() => _getCommentState();
}

class _getCommentState extends State<getComment> {
  List _get = [];

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
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
        title: Text('Comment'),
      ),
      body: RefreshIndicator(
        onRefresh: _getData,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(_get[index]['id'].toString()),
                  subtitle: Text(_get[index]['name']),
                  trailing: Text(_get[index]['email']));
            }),
      ),
    );
  }
}
