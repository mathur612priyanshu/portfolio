import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetail extends StatefulWidget {
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

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isTouchDevice = false; // Detects if the user is using a touch device

  void _launchURL() async {
    final Uri url = Uri.parse(widget.githubLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.githubLink}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isWideScreen = size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Listener(
        onPointerDown: (event) {
          // Detect touch input (finger/stylus)
          if (event.kind == PointerDeviceKind.touch) {
            setState(() {
              _isTouchDevice = true;
            });
          }
        },
        onPointerHover: (event) {
          // Detect mouse/trackpad input
          if (event.kind == PointerDeviceKind.mouse) {
            setState(() {
              _isTouchDevice = false;
            });
          }
        },
        child: _isTouchDevice
            ? InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 1.0,
                maxScale: 3.0, // Enables zooming only on touch devices
                child: _buildContent(isWideScreen),
              )
            : _buildContent(isWideScreen), // Normal behavior for mouse users
      ),
    );
  }

  Widget _buildContent(bool isWideScreen) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.projectName,
              style: TextStyle(
                fontSize: isWideScreen ? 28 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.projectIntro,
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
              widget.projectTech,
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
              itemCount: widget.projectSnaps.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.projectSnaps[index],
                    fit: BoxFit.cover,
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
    );
  }
}
