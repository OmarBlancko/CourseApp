import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/levels.dart';
import 'package:course_app/screens/detail/details_subject.dart';
import 'package:course_app/screens/home/widget/details_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LevelItem extends StatelessWidget {
  final Levels levels;
  LevelItem(this.levels);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: kPrimaryLight, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(levels.Image, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            levels.Titel,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: kFont),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsSubject(levels)));
              },
              child: Text("Enter"),
            ),
          ),
        ],
      ),
    );
  }
}
