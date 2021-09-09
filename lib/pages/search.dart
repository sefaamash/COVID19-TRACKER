import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  class Search extends SearchDelegate{
  final List countryList;

  Search(this.countryList);//country list holdsthe data from COUNTRYdATA

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query=''; //query is written by default in search delegate class


     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context); //whenever we search after search when we go to back to page we press back key so navigator.pop bring it back to that page

    },);
  }

  @override
  Widget buildResults(BuildContext context) {
return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
final suggestionList=query.isEmpty?countryList:countryList.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();

return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
       itemCount: suggestionList.length,
       itemBuilder: (context,index){
           return Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    height: 260,
                    child: Row(
                      children: [

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                suggestionList[index]['country'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Circilar'),
                              ),
                              Image.network(
                                suggestionList[index]['countryInfo']['flag'],
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
                                        suggestionList[index]['todayCases']
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'TodayDeaths:' +
                                      suggestionList[index]['todayDeaths']
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
                                      suggestionList[index]['todayRecovered']
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
                                      suggestionList[index]['active'].toString(),
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
                                      suggestionList[index]['deaths'].toString(),
                                      maxLines:2,
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
                                  ' Recovered:' +
                                      suggestionList[index]['recovered']
                                          .toString(),maxLines:1,
                                  style: TextStyle(
                                      fontFamily: 'Circilar',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                     
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                );

       });

  } }
