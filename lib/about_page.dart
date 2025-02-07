import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/provider_data.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isDarkMode = context.watch<ProviderData>().isDark();
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    bool isMobile = size.width < size.height;
    double titleSize = isMobile ? 24 : 32;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.all(15), // Adjusted padding to fit content
              child: isMobile
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildTitle(textColor, titleSize),
                        const SizedBox(height: 10),
                        _buildProfileImage(size.width * 0.4),
                        const SizedBox(height: 20),
                        _buildAboutText(textColor),
                        const SizedBox(height: 20),
                        _buildResumeButton(isDarkMode, context),
                      ],
                    )
                  : Column(
                      children: [
                        _buildTitle(textColor, titleSize),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildProfileImage(250),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildAboutText(textColor,
                                      textAlign: TextAlign.left),
                                  const SizedBox(height: 20),
                                  _buildResumeButton(isDarkMode, context),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(Color textColor, double Size) {
    return AutoSizeText(
      "About Me",
      style: TextStyle(
        fontSize: Size,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildProfileImage(double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/devIcon.png",
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildAboutText(Color textColor,
      {TextAlign textAlign = TextAlign.center}) {
    return AutoSizeText(
      "Aspiring and dedicated B.Tech Computer Science student at IIMT, with a passion for software development. Experienced in Flutter, Firebase, Java, Dart, and UI/UX design. Strong problem-solving skills with hands-on experience in DSA. Seeking opportunities to learn, innovate, and contribute to cutting-edge projects.",
      style: TextStyle(fontSize: 18, color: textColor, height: 1.6),
      textAlign: textAlign,
    );
  }

  Widget _buildResumeButton(bool isDarkMode, dynamic context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(
            "https://drive.google.com/file/d/1HvNltEPrG7WeBLbM_wGqpwdrrMbxk-OG/view?usp=sharing");
        if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw 'Could not launch "https://drive.google.com/file/d/1HvNltEPrG7WeBLbM_wGqpwdrrMbxk-OG/view?usp=sharing"';
        }
      },
      icon: const Icon(Icons.download, size: 20),
      label: const Text("Download Resume", style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        backgroundColor: isDarkMode ? Colors.blueGrey : Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
