import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  const MostAffectedPanel({key, Key,required this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Image.network(countryData[index]['countryInfo']['flag'],height: 30,),
                SizedBox(width: 6,),
                 SizedBox(height: 16,),
                
                Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Circilar'),),
                SizedBox(width: 6,),
                SizedBox(height: 16,),
                 Text('TodayRecovered:'+countryData[index]['todayRecovered'].toString(),  style: TextStyle(
                                      fontFamily: 'Circilar',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                   SizedBox(width: 6,),
                   SizedBox(height: 16,),
                Text('TodayCases:'+countryData[index]['todayCases'].toString(), style: TextStyle(
                                        fontFamily: 'Circilar',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                 SizedBox(width: 6,),

                 SizedBox(height: 16,),
                 Text('TodayDeaths:'+countryData[index]['todayDeaths'].toString(),style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                  SizedBox(width: 6,),
                  SizedBox(height: 16,),
                
                   Text('Active Cases:'+countryData[index]['active'].toString()),
                    SizedBox(width: 6,),
                    SizedBox(height: 16,),
                     Text('Total Deaths:'+countryData[index]['deaths'].toString() ,style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                       SizedBox(width: 6,),
                    SizedBox(height: 16,),
                     Text('Total Recovered:'+countryData[index]['recovered'].toString(),  style: TextStyle(
                                      fontFamily: 'Circilar',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                      SizedBox(width: 6,),
                    SizedBox(height: 20,),

              ],
              
            ),
          );
        },
       
     itemCount: 7),
    );
  }
}
