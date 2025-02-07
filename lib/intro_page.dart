import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool vertical = MediaQuery.of(context).size.width * 1.2 <
            MediaQuery.of(context).size.height
        ? true
        : false;
    var size = MediaQuery.of(context).size;
    return Container(
      height: vertical ? (size.height / 2) - 10 : size.height - 10,
      width: vertical ? size.width - 10 : (size.width / 2) - 10,
      margin: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Hello, I'am",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              minFontSize: 10,
              maxLines: 1,
            ),
            AutoSizeText(
              "Priyanshu Mathur",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              maxLines: 1,
              minFontSize: 17,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Add your button's action here
              },
              child: InkWell(
                onTap: () async {
                  final uri = Uri.parse(
                      "https://drive.google.com/file/d/1HvNltEPrG7WeBLbM_wGqpwdrrMbxk-OG/view?usp=sharing");
                  if (await launchUrl(uri,
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch "https://drive.google.com/file/d/1HvNltEPrG7WeBLbM_wGqpwdrrMbxk-OG/view?usp=sharing"';
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 10), // Adjust button padding
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.redAccent,
                        Colors.orangeAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AutoSizeText(
                    "View Resume",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: vertical ? 15 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 6,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
