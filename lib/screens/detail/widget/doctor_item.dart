import 'dart:async';
import 'dart:io';

import 'package:course_app/screens/detail/widget/pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:course_app/helper/sizeHelper.dart';
import 'package:course_app/models/doctor.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:path_provider/path_provider.dart';

class DoctorItem extends StatefulWidget {
  late final Doctor doctorDetails;
  DoctorItem(this.doctorDetails);
  @override
  State<DoctorItem> createState() => _DoctorItemState();
}

class _DoctorItemState extends State<DoctorItem> {
  bool isLoading = false;
  var pdfPath = '';
  @override
  void initState() {
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    fromAsset('assets/pdf/1.pdf', '1.pdf').then((f) {
      setState(() {
        pdfPath = f.path;
      });
    });
  }

// late PDFDocument pdf;
//   Future<void> loadPdf() async {
//     pdf = await PDFDocument.fromAsset('assets/pdf/1.pdf');
//     setState(() {
//       isLoading = true;
//     });
//   }
  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeHelper(context);
    return Column(children: [
      Container(
        padding: EdgeInsets.all(size.getHeight(10)),
        child: ListTile(
          leading: AvatarView(
            radius: size.getHeight(30),
            imagePath:
                widget.doctorDetails.imagePath ?? 'assets/images/default.jpg',
          ),
          title: Text(
            'د/ ${widget.doctorDetails.name}',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.getWidth(20),
            ),
          ),
          trailing: const Icon(Icons.arrow_downward),
        ),
      ),
      TextButton(
          onPressed: () {
            if (pdfPath.isNotEmpty) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(path: pdfPath),
                  ));
            }
          },
          child: Text('go to pdf file')),

    ]);
  }
}
