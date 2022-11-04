import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';

class Homecontainerall extends StatefulWidget {
  const Homecontainerall(
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
  State<Homecontainerall> createState() => _HomecontainerallState();
}

class _HomecontainerallState extends State<Homecontainerall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: kbackgroundcolor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 0.0, color: Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 7.0, bottom: 5.0, left: 10.0, right: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 130.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.Eventiimage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 0.0),
                ),
              ),
              SizedBox(
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
              SizedBox(
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
                        fontSize: 10.0,
                        color: kbuttonbackcolor),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(
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
      ),
    );
  }
}
