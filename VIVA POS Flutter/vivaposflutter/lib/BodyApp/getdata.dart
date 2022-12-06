import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class getdata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _getdata();
  }
}

class _getdata extends State<getdata> {
  Future getdataapi() async {
    print("1");
    var url =
        Uri.parse('https://pp-api-merchant.myviva.net/api/FuelOilProductSale');
    var response = await http.post(url, body: {
      "productID": 1417,
      "amount": 1.0,
      "paymentMethod": 1,
      "couponPinCode": null,
      "paymentProviderId": null,
      "logType": 0,
      "plateNumber": "",
      "mileage": 0,
      "ServerDateTime": null,
      "Identification": {
        "AuthenticationType": 2,
        "Identity1": "9961010701000092",
        "Identity2": "lI9@"
      }
    }, headers: {
      "dSerial": "1813CA805748A00025",
      "username": "1446",
      "password": "mNiL",
      "dType": "1"
    });
    var responsebody = jsonDecode(response.body);
    print("2");
    print(responsebody);
    return responsebody;
  }

  Map h = {};
  Future getdatapo() async {
    var client = http.Client();
    print("1");
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    print("1.5");
    var response = await http.get(url);
    var respbody = jsonDecode(response.body);
    print("2");
    print(respbody);
    return respbody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              print("00000");
              getdatapo();
            },
            child: Text("Get Data")),
        FutureBuilder(
            future: getdatapo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: ListTile(
                                  title: Text(
                                    snapshot.data[i]['title'],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    snapshot.data[i]['body'],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                );
              }
              return const Center(child: Text("No Data"));
            })
      ]),
    );
  }
}
