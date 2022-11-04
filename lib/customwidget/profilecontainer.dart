import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatefulWidget {
  ProfileContainer(
      {required this.icon, required this.data, required this.Ontap});
  final IconData icon;
  final String data;
  final Function Ontap;

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Color colorfiled = kTextcolor;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.Ontap(),
      child: Container(
        height: 54,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                widget.icon,
                color: widget.data == 'Logout' ? Colors.red : colorfiled,
                size: 27,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: SizedBox(
                  width: 200,
                  child: Text(widget.data,
                      style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 15.0,
                          color: widget.data == 'Logout'
                              ? Colors.red
                              : colorfiled))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.navigate_next,
                color: colorfiled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
