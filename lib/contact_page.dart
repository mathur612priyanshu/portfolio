import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Me",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // Contact Info Section
          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [
              contactInfo(Icons.location_on, "Location",
                  "Bulandshahr, Uttar Pradesh, India", () {
                _launchMap("Bulandshahr, Uttar Pradesh, India");
              }),
              contactInfo(Icons.email, "Email", "mathur612priyanshu@gmail.com",
                  () {
                _launchEmail("mathur612priyanshu@gmail.com");
              }),
              contactInfo(Icons.phone, "Phone", "+91 9411619711", () {
                _launchPhone("+919411619711");
              }),
            ],
          ),
          const SizedBox(height: 24),

          // Social Media Section
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              socialIcon(FontAwesomeIcons.linkedin,
                  "https://www.linkedin.com/in/priyanshu-mathur-89b302228/"),
              const SizedBox(width: 20),
              socialIcon(FontAwesomeIcons.instagram,
                  "https://www.instagram.com/mathur_.priyanshu/"),
              const SizedBox(width: 20),
              socialIcon(FontAwesomeIcons.whatsapp, "https://wa.me/9411619711"),
            ],
          ),
          const SizedBox(height: 24),

          const Divider(color: Colors.white54),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "© 2025. All rights reserved.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Contact Info Widget with Clickable Action
  Widget contactInfo(
      IconData icon, String title, String info, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 24),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Social Media Icons with Click Action
  Widget socialIcon(IconData icon, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Icon(
        icon,
        size: 30,
        color: Colors.white70,
      ),
    );
  }

  // Function to Launch URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  // Function to Open Email App
  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri.parse("mailto:$email");
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch email';
    }
  }

  // Function to Open Phone Dialer
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri.parse("tel:$phoneNumber");
    if (!await launchUrl(phoneUri)) {
      throw 'Could not launch phone';
    }
  }

  // Function to Open Google Maps
  Future<void> _launchMap(String address) async {
    final Uri mapUri =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$address");
    if (!await launchUrl(mapUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch maps';
    }
  }
}
