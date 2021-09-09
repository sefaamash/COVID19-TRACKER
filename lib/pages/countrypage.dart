import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'search.dart';

class Countrypage extends StatefulWidget {
  const Countrypage({Key? key}) : super(key: key);

  @override
  _CountrypageState createState() => _CountrypageState();
}

class _CountrypageState extends State<Countrypage> {
  List countryData = [];

  get delegate => null;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      //to decode it in json
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate:Search(countryData));
            },
          )
        ],
        title: Text("Country Statistics"),
      ),
      body: countryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
            shrinkWrap: true,
       
              itemCount: countryData == null ? 0 : countryData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      height: 260,
                   
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Circilar'),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 40,
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                         
                          Expanded(
                              child: Center(
                            child: Container(
                              padding: EdgeInsets.all(50),
                              child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 0),
                                    child: Text(
                                      'TodayCases:' +
                                          countryData[index]['todayCases']
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Circilar',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'TodayDeaths:' +
                                        countryData[index]['todayDeaths']
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'TodayRecovered:' +
                                        countryData[index]['todayRecovered']
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Active Cases:' +
                                        countryData[index]['active'].toString(),
                                    style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Total Deaths:' +
                                        countryData[index]['deaths'].toString(),
                                    style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Recovered:' +
                                        countryData[index]['recovered']
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
