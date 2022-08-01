import 'dart:developer';
import 'dart:ui';

import 'package:course_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kFontLight, width: 2)),
            child: TextField(
              cursorColor: kFontLight,
              decoration: InputDecoration(
                //fillColor: kFont.withOpacity(0.1),
                filled: true,
                // contentPadding: EdgeInsets.all(18),
                border: InputBorder.none,
                hintText: "Search for history , classes,...",
                hintStyle: TextStyle(color: kFontLight),
              ),
            ),
          ),
          Positioned(
            right: 45,
            top: 35,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kAccent,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              width: 30,
            ),
          )
        ],
      ),
    );
  }
}
