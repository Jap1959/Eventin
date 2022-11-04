import 'package:eventzu/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerForHomeGrid extends StatefulWidget {
  const ShimmerForHomeGrid({Key? key}) : super(key: key);

  @override
  State<ShimmerForHomeGrid> createState() => _ShimmerForHomeGridState();
}

class _ShimmerForHomeGridState extends State<ShimmerForHomeGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
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
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 130.0,
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
                width: 130.0,
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
                width: 130.0,
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
                    width: 50.0,
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
