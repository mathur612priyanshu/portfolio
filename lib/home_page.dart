import 'package:flutter/material.dart';
import 'package:portfolio/about_page.dart';
import 'package:portfolio/birb_animation.dart';
import 'package:portfolio/contact_page.dart';
import 'package:portfolio/customAppBar.dart';
import 'package:portfolio/intro_page.dart';
import 'package:portfolio/projects_page.dart';
import 'package:portfolio/provider_data.dart';
import 'package:portfolio/skills_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Add a ScrollController
  final ScrollController _scrollController = ScrollController();

  // Function to Scroll to a Specific Section
  void scrollToSection(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isDarkMode = context.watch<ProviderData>().isDark();
    bool isMobile = size.width < 500 ? true : false;

    return Scaffold(
      // appBar: customAppBar(context, _scaffoldKey, isDarkMode, scrollToSection),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        controller: _scrollController, // ✅ Attach controller to scroll
        child: Column(
          children: [
            customAppBar(context, _scaffoldKey, isDarkMode, scrollToSection),
            SizedBox(
              child: size.width * 1.2 > size.height
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: IntroPage(),
                          height: size.height - 70,
                          width: size.width / 2,
                        ),
                        SizedBox(
                          child: BirbAnimation(),
                          height: size.height - 70,
                          width: size.width / 2,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          child: BirbAnimation(),
                          height: (size.height / 2),
                          width: size.width,
                        ),
                        SizedBox(
                          child: IntroPage(),
                          height: (size.height / 2) - 70,
                          width: size.width,
                        ),
                      ],
                    ),
            ),
            SizedBox(
              key: Key("about"), // 🔹 Add Key for scrolling
              child: AboutPage(),
              height:
                  size.width > size.height ? size.height / 1.5 : size.height,
              width: size.width,
            ),
            SizedBox(height: 30),
            SizedBox(
                key: Key("projects"),
                child: ProjectsPage(),
                height: isMobile ? size.height * 2 : size.height),
            SizedBox(
              key: Key("skills"),
              child: SkillsPage(),
              height: size.height,
            ),
            SizedBox(
              key: Key("contact"),
              child: ContactPage(),
              // height: size.height,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        width: size.width * 0.7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: BirbAnimation()),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('About'),
              onTap: () {
                _scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(size.height); // 🔹 Scroll to About
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Projects'),
              onTap: () {
                _scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(size.height * 2); // 🔹 Scroll to Projects
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer_rounded),
              title: const Text('Skills'),
              onTap: () {
                _scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(size.height * 4); // 🔹 Scroll to Skills
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact'),
              onTap: () {
                _scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(size.height * 5); // 🔹 Scroll to Contact
              },
            ),
            ListTile(
              leading: Icon(isDarkMode ? Icons.nights_stay : Icons.wb_sunny),
              title: const Text('Change Theme'),
              trailing: Text(isDarkMode ? "Dark" : "Light"),
              onTap: () {
                context.read<ProviderData>().changeTheme();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: isDarkMode
              ? Colors.white
              : const Color.fromARGB(255, 89, 205, 255),
          onPressed: () {
            scrollToSection(0);
          },
          child: Icon(
            Icons.arrow_upward,
            size: 40,
            color: !isDarkMode ? Colors.white : Colors.lightBlueAccent,
          )),
    );
  }
}
