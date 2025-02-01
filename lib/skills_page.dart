import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/provider_data.dart';
import 'package:provider/provider.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      "https://img.icons8.com/?size=100&id=7I3BjCqe9rjG&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=7AFcZ2zirX6Y&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=13679&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=62452&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=50196&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=efFfwotdkiU5&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=DiLe49bv04F9&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=7sdIaR7HcdFE&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=17836&format=png&color=000000",
      "https://upload.wikimedia.org/wikipedia/commons/1/19/C_Logo.png",
      "https://img.icons8.com/?size=100&id=20909&format=png&color=000000",
      "https://img.icons8.com/?size=100&id=21278&format=png&color=000000",
      // "https://img.icons8.com/?size=100&id=PXTY4q2Sq2lG&format=png&color=000000"
    ];

    List<String> skills = [
      "Flutter",
      "Dart",
      "Java",
      "Firebase",
      "REST API",
      "GitHub",
      "DSA",
      "DBMS",
      "OS",
      "C",
      "HTML",
      "CSS",
      // "JS"
    ];
    bool isDark = context.watch<ProviderData>().isDark();
    var size = MediaQuery.of(context).size;
    // bool isMobile = MediaQuery.of(context).size.width * 1.2 <
    //         MediaQuery.of(context).size.height
    //     ? true
    //     : false;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(size.width / 15),
        child: Column(
          children: [
            Text(
              "Skills",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                // color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250, // Adjust grid item width
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.5, // Adjust row height
                ),
                itemCount: skills.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(icons[index], width: 40, height: 40,
                            errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, color: Colors.red);
                        }),
                        SizedBox(width: 10),
                        Flexible(
                          child: AutoSizeText(skills[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // color: Colors.white,
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
