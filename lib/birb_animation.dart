import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class BirbAnimation extends StatefulWidget {
  const BirbAnimation({super.key});

  @override
  State<BirbAnimation> createState() => _BirbAnimationState();
}

class _BirbAnimationState extends State<BirbAnimation> {
  Artboard? riveArtboard;
  SMIBool? isDance;
  SMITrigger? isLookUp;

  @override
  void initState() {
    super.initState();

    // Initialize RiveFile before loading assets
    RiveFile.initialize().then((_) {
      rootBundle.load("assets/rive/birb.riv").then((data) async {
        try {
          final file = RiveFile.import(data);
          if (file.mainArtboard == null) {
            print('Artboard is null');
            return;
          }
          final artboard = file.mainArtboard;

          try {
            var controller =
                StateMachineController.fromArtboard(artboard, 'birb');
            if (controller == null) {
              print('Controller is null or State Machine not found');
              return;
            }
            artboard.addController(controller);
            isDance = controller.findSMI('dance');
            isLookUp = controller.findSMI('look up');
          } catch (e) {
            print('Error setting up state machine: $e');
          }

          setState(() => riveArtboard = artboard);
        } catch (e) {
          print('Error loading Rive file: $e');
        }
      });
    }).catchError((e) {
      print('Error initializing RiveFile: $e');
    });
  }

  void toggleDance() {
    if (isDance != null) {
      setState(() => isDance!.value = true);
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          isDance!.value = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: riveArtboard == null
          ? const Center(child: Text('Failed to load Rive animation'))
          : Column(
              children: [
                Expanded(
                  child: MouseRegion(
                    onHover: (_) {
                      toggleDance();
                    },
                    child: GestureDetector(
                      onTap: () {
                        isLookUp?.value = true;
                      },
                      onLongPress: () {
                        toggleDance();
                      },
                      child: Rive(
                        artboard: riveArtboard!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
    );
  }
}
