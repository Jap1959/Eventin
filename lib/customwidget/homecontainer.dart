import 'package:eventzu/constants.dart';
import 'package:eventzu/services/clubmanagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomecontainerTrends extends StatefulWidget {
  const HomecontainerTrends(
      {required this.onTap,
      required this.Eventype,
      required this.Eventname,
      required this.Eventdate,
      required this.Eventclubname,
      required this.Eventiimage});
  final bool onTap;
  final String Eventype;
  final String Eventname;
  final String Eventdate;
  final String Eventclubname;
  final String Eventiimage;

  @override
  State<HomecontainerTrends> createState() => _HomecontainerTrendsState();
}

class _HomecontainerTrendsState extends State<HomecontainerTrends> {
  @override
  Map<String, String> Eventdata = {};
  Widget build(BuildContext context) {
    return widget.onTap == false
        ? Container(
            margin: const EdgeInsets.only(top: 5.0, right: 10.0, bottom: 10.0),
            width: 300.0,
            height: 350.0,
            decoration: BoxDecoration(
              color: kbackgroundcolor,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 0.0, color: Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.Eventiimage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 0.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.Eventname,
                    style: TextStyle(
                        fontFamily: "sans-serif",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: kTextcolor),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.Eventype,
                        style: TextStyle(
                            fontFamily: "sans-serif",
                            fontSize: 15.0,
                            color: kbuttonbackcolor),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        widget.Eventdate,
                        style: TextStyle(
                            fontFamily: "sans-serif",
                            fontSize: 15.0,
                            color: kbuttonbackcolor),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    widget.Eventclubname,
                    style: TextStyle(
                        fontFamily: "sans-serif",
                        fontSize: 15.0,
                        color: kTextcolor),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            width: 300.0,
            height: 350.0,
            child: SpinKitFadingCircle(
              color: kbuttonbackcolor,
            ),
          );
  }
}
