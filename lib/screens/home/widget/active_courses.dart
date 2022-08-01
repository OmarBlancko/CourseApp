import 'package:course_app/constants/colors.dart';
import 'package:course_app/screens/home/widget/category_titel.dart';
import 'package:course_app/screens/home/widget/levels_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CatogaryTitel(leftText: "Almost View", rightText: ""),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: kFontLight.withOpacity(0.1),
                border:
                    Border.all(color: kFontLight.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child:
                            Image.asset("assets/images/logo.png", width: 60)),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Busniess",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kFont),
                        ),
                        Text(
                          "2 lesson left",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kFontLight),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 55,
                ),
                CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth: 5.0,
                  percent: 0.61,
                  center: Text(
                    "61%",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  progressColor: kAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
