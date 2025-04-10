import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/project_detail.dart';
import 'package:portfolio/provider_data.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<bool> _isHovered = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    List<String> projectName = [
      "Nexo Vision",
      "Wallpaper App",
      "ToDo App",
      "WhatsApp UI",
      "News App",
      "Meme App"
    ];
    List<String> projectImage = [
      "assets/images/nexo3.png",
      "assets/images/walpy1.png",
      "assets/images/todo3.png",
      "assets/images/whatsapp1.png",
      "assets/images/news2.png",
      "assets/images/meme1.png"
    ];
    List<String> projectIntro = [
      "Nexo Vision is a digital platform designed for students and teachers, serving as a technical bridge to enhance communication and connectivity in an academic environment. The application offers features such as face recognition-based attendance, the ability to upload and access notes and previous year question papers, and direct access to essential college resources, including the college website and ERP system. It also incorporates role-based access control, ensuring a tailored experience for students and teachers with different data views.",
      "A wallpaper app allowing users to browse, search, and set wallpapers from a vast collection.",
      "A simple todo app for managing your daily tasks with options of adding, updating and deleting task in offline mode.",
      "A WhatsApp UI clone built in Flutter showcasing UI development skills.",
      "A news app fetching live news updates via API, displaying categorized news.",
      "A meme-sharing app displaying trending memes and allowing users to download and share them."
    ];
    List<String> projectTech = [
      "Flutter, Dart, Firebase(Authentication, CloudStorage), Cloudinary, face++ API, Artificial Intelligence",
      "Flutter, Dart, REST API",
      "Flutter, Dart, Provider State management, MVC Architecture",
      "Flutter, Dart",
      "Flutter, Dart, REST API",
      "Flutter, Dart"
    ];
    List<String> githubLink = [
      "https://github.com/mathur612priyanshu/nexo_vision",
      "https://github.com/mathur612priyanshu/walpy_app",
      "https://github.com/mathur612priyanshu/todo_app",
      "https://github.com/mathur612priyanshu/UI-Whatsapp/tree/master",
      "https://github.com/mathur612priyanshu/newsApp",
      "https://github.com/mathur612priyanshu/meme_app"
    ];
    List<List<String>> projectImageList = [
      [
        "assets/images/nexo1.png",
        "assets/images/nexo2.png",
        "assets/images/nexo3.png",
        "assets/images/nexo4.png",
        "assets/images/nexo5.png",
        "assets/images/nexo6.png",
        "assets/images/nexo7.png",
        "assets/images/nexo8.png",
        "assets/images/nexo9.png",
        "assets/images/nexo10.png",
        "assets/images/nexo11.png",
        "assets/images/nexo12.png",
        "assets/images/nexo13.png",
        "assets/images/nexo14.png",
        "assets/images/nexo15.png",
        "assets/images/nexo16.png",
        "assets/images/nexo17.png",
      ],
      [
        "assets/images/walpy1.png",
        "assets/images/walpy2.png",
        "assets/images/walpy3.png",
        "assets/images/walpy4.png",
        "assets/images/walpy5.png",
      ],
      [
        "assets/images/todo1.png",
        "assets/images/todo2.png",
        "assets/images/todo3.png",
        "assets/images/todo4.png",
        "assets/images/todo5.png",
      ],
      [
        "assets/images/whatsapp1.png",
        "assets/images/whatsapp2.png",
        "assets/images/whatsapp3.png",
        "assets/images/whatsapp4.png",
        "assets/images/whatsapp5.png",
      ],
      [
        "assets/images/news1.png",
        "assets/images/news2.png",
        "assets/images/news3.png",
      ],
      ["assets/images/meme1.png", "assets/images/meme2.png"]
    ];
    final isDarkMode = context.watch<ProviderData>().isDark();
    var size = MediaQuery.of(context).size;
    bool isDark = context.watch<ProviderData>().isDark();
    bool isViewAll = context.watch<ProviderData>().isViewAll();

    return Scaffold(
      // appBar: isViewAll ? AppBar() : null,
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Card(
          elevation: 8, // Elevation effect for the entire section
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: isDarkMode ? Colors.grey[900] : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20), // Padding for the whole content
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Projects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 600,
                      crossAxisSpacing: size.width / 50,
                      mainAxisSpacing: size.width / 50,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: projectName.length,
                    physics: isViewAll
                        ? BouncingScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MouseRegion(
                        onEnter: (_) =>
                            setState(() => _isHovered[index] = true),
                        onExit: (_) =>
                            setState(() => _isHovered[index] = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: _isHovered[index]
                              ? (Matrix4.identity()..scale(1.05))
                              : Matrix4.identity(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: isDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.white,
                            elevation: _isHovered[index] ? 12 : 6,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    projectName[index],
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(child: SizedBox(height: 1)),
                                  Expanded(
                                    flex: 15,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        projectImage[index],
                                        width: double.infinity,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox(height: 8)),
                                  AutoSizeText(
                                    projectIntro[index],
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Expanded(child: SizedBox(height: 1)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProjectDetail(
                                                          projectName:
                                                              projectName[
                                                                  index],
                                                          projectIntro:
                                                              projectIntro[
                                                                  index],
                                                          projectTech:
                                                              projectTech[
                                                                  index],
                                                          projectSnaps:
                                                              projectImageList[
                                                                  index],
                                                          githubLink:
                                                              githubLink[index],
                                                        )));
                                          },
                                          style: ButtonStyle(),
                                          child: const Text("View"),
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: ElevatedButton.icon(
                                          onPressed: () async {
                                            final uri =
                                                Uri.parse(githubLink[index]);
                                            if (!await launchUrl(uri,
                                                mode: LaunchMode
                                                    .externalApplication)) {
                                              throw 'Could not launch ${githubLink[index]}';
                                            }
                                          },
                                          icon: Image.network(
                                            "https://img.icons8.com/?size=100&id=efFfwotdkiU5&format=png&color=000000",
                                            width: 18,
                                            height: 18,
                                          ),
                                          label: const Text("GitHub"),
                                          style: ButtonStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: isViewAll
          ? FloatingActionButton(
              backgroundColor: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(255, 89, 205, 255),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 40,
                color: !isDarkMode ? Colors.white : Colors.lightBlueAccent,
              ))
          : null,
    );
  }
}
