import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatelessWidget {
  final String projectName;
  final String projectIntro;
  final List<String> projectSnaps;
  final String projectTech;
  final String githubLink;

  const ProjectDetail({
    super.key,
    required this.projectName,
    required this.projectIntro,
    required this.projectTech,
    required this.projectSnaps,
    required this.githubLink,
  });

  void _launchURL() async {
    final Uri url = Uri.parse(githubLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $githubLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isWideScreen = size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projectName,
                style: TextStyle(
                  fontSize: isWideScreen ? 28 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                projectIntro,
                style: TextStyle(fontSize: isWideScreen ? 18 : 14),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              Text(
                "Technologies Used:",
                style: TextStyle(
                  fontSize: isWideScreen ? 20 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                projectTech,
                style: TextStyle(fontSize: isWideScreen ? 18 : 14),
              ),
              const SizedBox(height: 20),
              Text(
                "Project Screenshots:",
                style: TextStyle(
                  fontSize: isWideScreen ? 20 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isWideScreen ? 3 : 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: projectSnaps.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        projectSnaps[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _launchURL,
                  icon: Icon(Icons.code, size: isWideScreen ? 24 : 18),
                  label: Text(
                    "View on GitHub",
                    style: TextStyle(fontSize: isWideScreen ? 18 : 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: isWideScreen ? 20 : 15, vertical: 12),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
