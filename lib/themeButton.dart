import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_data.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ProviderData>().isDark();

    return GestureDetector(
      onTap: () {
        context.read<ProviderData>().changeTheme();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[850] : Colors.yellow[600],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:
                  isDarkMode ? Colors.black54 : Colors.yellow.withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Transform.rotate(
          angle: isDarkMode ? 0.5 : 0, // Adjust rotation angle as per the theme
          child: Icon(
            isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
            color: isDarkMode ? Colors.white : Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
