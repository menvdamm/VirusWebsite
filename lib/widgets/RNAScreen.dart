import 'package:flutter/material.dart';

import 'MenuButton.dart';

class RNAScreen extends StatelessWidget {
  const RNAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                MenuButton(
                  options: const ["Segment 1", " Segment 2"],
                  selection: "Segment 1",
                ),
              ],
            ),
            SizedBox(
              height: 0.05 * MediaQuery.of(context).size.height,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                SizedBox(
                  width: 0.075 * MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'lib/images/tree.png',
                  width: 0.4 * MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.05 * MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'lib/images/rna.png',
                  width: 0.4 * MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.075 * MediaQuery.of(context).size.width,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                SizedBox(
                  width: 0.075 * MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.15 * MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'lib/images/slider.png',
                  width: 0.1 * MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.15 * MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.05 * MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'lib/images/genome.png',
                  width: 0.4 * MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  width: 0.075 * MediaQuery.of(context).size.width,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
