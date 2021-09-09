import 'package:corona_tracker/datasource.dart';
import 'package:flutter/material.dart';

class Faqspage extends StatelessWidget {
  const Faqspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQS')),
      body: ListView.builder(itemCount:DataSource.questionAnswers.length ,
        itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(DataSource.questionAnswers[index]['question']),
          children: [
            Text(DataSource.questionAnswers[index]['answer'])
          ],
        );
        
      }),
    );
  }
}
