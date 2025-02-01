import 'package:flutter/material.dart';
import 'package:portfolio/themeButton.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDark;

  const HoverButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isDark})
      : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            border: isHovered
                ? Border(
                    bottom: BorderSide(
                        width: 2,
                        color: widget.isDark ? Colors.white : Colors.black))
                : null,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: isHovered
                  ? (widget.isDark ? Colors.blue[300] : Colors.blue[700])
                  : (widget.isDark ? Colors.white : Colors.black),
              fontSize: 16,
              fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom AppBar Function
AppBar customAppBar(BuildContext ctx, GlobalKey<ScaffoldState> scaffoldKey,
    bool isDark, Function(double) scrollToSection) {
  var size = MediaQuery.of(ctx).size;

  if (size.height < size.width * 1.2) {
    return AppBar(
      centerTitle: true,
      backgroundColor: isDark ? Colors.black : Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HoverButton(
              text: "About",
              onPressed: () => scrollToSection(size.height),
              isDark: isDark),
          SizedBox(width: 20),
          HoverButton(
              text: "Projects",
              onPressed: () => scrollToSection(size.height + size.height / 1.5),
              isDark: isDark),
          SizedBox(width: 20),
          HoverButton(
              text: "Skills",
              onPressed: () =>
                  scrollToSection(size.height * 2 + size.height / 1.5 + 20),
              isDark: isDark),
          SizedBox(width: 20),
          HoverButton(
              text: "Contact",
              onPressed: () =>
                  scrollToSection(size.height * 3 + size.height / 1.5),
              isDark: isDark),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: ThemeToggleButton(),
        ),
      ],
      leading: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          "assets/images/pm logo.jpg",
          fit: BoxFit.contain,
        ),
      ),
    );
  } else {
    return AppBar(
      leading: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          "assets/images/pm logo.jpg",
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
      ],
    );
  }
}
