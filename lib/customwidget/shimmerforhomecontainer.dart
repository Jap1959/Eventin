import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerForHomePage extends StatefulWidget {
  const ShimmerForHomePage({Key? key}) : super(key: key);

  @override
  State<ShimmerForHomePage> createState() => _ShimmerForHomePageState();
}

class _ShimmerForHomePageState extends State<ShimmerForHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
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
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: kbackgroundcolor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 0.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 300.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: kbackgroundcolor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 300.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: kbackgroundcolor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 100,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: kbackgroundcolor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
