import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClubscateContainer extends StatefulWidget {
  ClubscateContainer({required this.Cateogeryname, required ontap});
  final String Cateogeryname;
  @override
  State<ClubscateContainer> createState() => _ClubscateContainerState();
}

class _ClubscateContainerState extends State<ClubscateContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 170.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kbackgroundcolor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 0.0, color: Colors.transparent),
        ),
        child: Center(
          child: Text(
            '${widget.Cateogeryname}',
            style: TextStyle(
                fontFamily: "sans-serif",
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: kTextcolor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
