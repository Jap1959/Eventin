import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';

class ClubmemberContainer extends StatefulWidget {
  ClubmemberContainer({required this.membername, required this.memberpost});
  final String membername;
  final String memberpost;

  @override
  State<ClubmemberContainer> createState() => _ClubmemberContainerState();
}

class _ClubmemberContainerState extends State<ClubmemberContainer> {
  @override
  initState() {
    print("membername====>${widget.membername}");
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        color: kbackgroundcolor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 0.0, color: Colors.transparent),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/membericon.png'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.membername}',
                    style: TextStyle(
                        fontFamily: "sans-serif",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: kTextcolor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${widget.memberpost}',
                    style: TextStyle(
                        fontFamily: "sans-serif",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: kbuttonbackcolor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
