import 'package:book_app/resource/colors.dart';
import 'package:book_app/resource/widgets.dart';
import 'package:flutter/material.dart';

import '../bookdetail.dart';

class BookDetails extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset("assets/mermaid_large.png",width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("The Little mermaid", style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 21
                      ),),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          StarRating(rating: 5,),
                          SizedBox(height: 6,),
                          Text("Fairy Tales", style: TextStyle(
                              color: darkGreen,
                              fontSize: 14
                          ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("“The Little Mermaid” is a fairy tale written by the Danish author Hans Christian Andersen. The story follows the journey of a young mermaid who is willing to give up her life in the sea as a mermaid to gain a human soul. The tale was first published in 1837 as part of a collection of fairy tales for children.", style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    letterSpacing: 0.6,
                    wordSpacing: 0.6,
                  ),),
                  SizedBox(height: 80,),
                  Row(
                    children: <Widget>[
                      //buraya
                      Padding(
                        padding: const EdgeInsets.only(left: 180.0),
                        child: SizedBox(
                          height: 80,
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff069494),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(50)
                                  )

                              ),
                              child: const Text('start reading'),
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MyTextScreen()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      //buraya
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}