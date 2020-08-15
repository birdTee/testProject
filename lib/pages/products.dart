import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:testproject/models/products_model.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List products;

  @override
  void initState() {
    this.loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP BAR HEAD'),
      ),
      body: new Slidable.builder(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.album),
            title: Text('Tile Area'),
            subtitle: Text('Sub Title Tile Area'),
          ),
        ),
        actionDelegate: <Widget>[
          IconSlideAction(
            caption: 'Complete',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => _showSnackBar('Complete'),
          )
        ],
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('APP BAR HEAD'),
  //     ),
  //     body: new ListView.builder(
  //       itemCount: products == null ? 0 : products.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Center(
  //           child: new Card(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //                 new ListTile(
  //                   leading: Icon(Icons.album),
  //                   title: Text(
  //                     products[index]["l_name"],
  //                     style: TextStyle(
  //                       fontSize: 16.0,
  //                       fontFamily: 'Kanit',
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget buildText() {
  //   return Center(
  //     child: Column(
  //       children: [
  //         Text('TEST BODY APP BAR'),
  //         FlatButton.icon(
  //           onPressed: loadData,
  //           icon: Icon(Icons.list),
  //           label: Text('List Lack Products'),
  //           color: Color(0xffffc907),
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future<Null> loadData() async {
    String urlAPI =
        'http://www.scitrader.co.th/VR/app/productAPI2.php?act=callLackList';
    Response response = await Dio().get(urlAPI);

    setState(() {
      products = json.decode(response.data);
    });

    print(products[1]['l_name']);

    // final jsonData = json.decode(response.data);

    //print('response = $response.data["l_name"][0]');
    //print(response.data["l_name"][0]);
  }
}
