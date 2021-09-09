import 'dart:convert';

import 'package:corona_tracker/datasource.dart';

import 'package:corona_tracker/pages/countrypage.dart';
import 'package:corona_tracker/panels/infopanel.dart';
import 'package:corona_tracker/panels/mostaffectedcountries.dart';
import 'package:corona_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   Map worldData={};
  fetchWorldWideData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      //to decode it in json
      worldData = json.decode(response.body);
    });
  }

    List<dynamic> countryData=[];
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
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    
         
          centerTitle:
              false, //itis center by default so we false it as we dont wont in center
          title: Text("COVID-19 TRACKER"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                color: Colors.orange[100], //[100]is color shade
                padding: EdgeInsets.all(15),
                child: Center(
                    child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontFamily: 'Circilar',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "WorldWide",
                      style: TextStyle(
                          fontFamily: 'Circilar',
                          fontSize: 23,
                          fontWeight: FontWeight.bold
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Countrypage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Regional ",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Circilar',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldWidePanel(
                    key: null,
                      worldData: worldData,
                      
                    ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Most Affected Countries ",
                  style: TextStyle(
                      fontFamily: 'Circilar',
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              countryData == null
                  ? Container()
                  : MostAffectedPanel(
                      countryData: countryData,
                    ),
              InfoPanel(),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'WE ARE TOGETHER IN THE FIGHT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: 'circilar'),
              )),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}
