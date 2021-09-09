import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
   final Map  worldData;
  const WorldWidePanel({required key ,Key, required this.worldData}) : super(key: key);
 
 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap:
            true, //it constraints the height an wrap in the desired height
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                2), //CHILD ASPECT RATIO IS TWICE THE WIDTH ACCORDING TO HEIGHT
        children: [
          // its a constructor we make it 4 bcz boxes are four
          StatusPanel(
            title: "CONFIRMED",
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: worldData['cases'].toString(),
            Key: null,
          ),
          StatusPanel(
            title: "ACTIVE",
            panelColor: Colors.orange[100],
            textColor: Colors.orange[900],
            count: worldData['active'].toString(),
            Key: null,
          ),
          StatusPanel(
            title: "RECOVERED",
            panelColor: Colors.green[100],
            textColor: Colors.green[900],
            count: worldData['recovered'].toString(),
            Key: null,
          ),
          StatusPanel(
            title: "DEATHS",
            panelColor: Colors.grey[100],
            textColor: Colors.grey[900],
            count: worldData['deaths'].toString(),
            Key: null,
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final  panelColor;
  final  textColor;
  final String  title;
  final String count;

  const StatusPanel(
      {required Key,
      key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count})
      : super(key: Key);

  @override
  Widget build(BuildContext context) {
    //variables because every box have different text color and heading color and box color

    //device width
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Circilar',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
          Text(count.toString(),
              style: TextStyle(
                  fontFamily: 'Circilar',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor))
        ],
      ),
    );
  }
}
