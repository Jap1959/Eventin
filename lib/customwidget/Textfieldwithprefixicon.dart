import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';

class Textfieldwithprefixicon extends StatefulWidget {
  Textfieldwithprefixicon(this.name, this.icon);
  String name;
  IconData icon;
  @override
  State<Textfieldwithprefixicon> createState() =>
      _TextfieldwithprefixiconState();
}

class _TextfieldwithprefixiconState extends State<Textfieldwithprefixicon> {
  @override
  final _formkey = GlobalKey<FormState>();

  FocusNode _textFieldFocus = FocusNode();
  Color _color = kbuttonbackgroundcolor;
  Color _coloricon = kbuttonbackgroundcolor;
  void buttonsate() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = Color(0xFFf2f1ff);
          _coloricon = Color(0xFF584cf4);
        });
      } else {
        setState(() {
          _color = kbuttonbackgroundcolor;
          _coloricon = Color(0xFFa8a8a8);
        });
      }
    });
  }

  void initState() {
    // TODO: implement initState
    buttonsate();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          // controller: ,
          // validator:  (value) {
          //   if (value!.isEmpty ||
          //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          //           .hasMatch(value)) {
          //     return 'Enter a valid Email';
          //   } else {
          //     email = emailController.text.toString();
          //     return null;
          //   }
          // },
          focusNode: _textFieldFocus,
          decoration: InputDecoration(
            fillColor: _color,
            prefixIcon: Icon(widget.icon),
            iconColor: _coloricon,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                width: 2.0,
                color: Color(0xFF7b72f7),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
            hintText: widget.name,
            hintStyle: TextStyle(
              fontFamily: "inter" "sans-serif",
              color: kdividertextcolor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
