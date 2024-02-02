import 'package:flutter/material.dart';

class HoverDialogExample extends StatefulWidget {
  const HoverDialogExample({super.key});

  @override
  _HoverDialogExampleState createState() => _HoverDialogExampleState();
}

class _HoverDialogExampleState extends State<HoverDialogExample> {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Text to be hovered over
          MouseRegion(
            onExit: (p) => _removeOverlay(),
            onEnter: (hovered) {
              _showOverlay(context);
            },
            child: const Text(
              'Hover over me',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    // Create and show the overlay entry
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // Adjust position as needed
        top: 50,
        left: 50,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'More Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text('Additional information goes here...'),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    // Remove the overlay entry
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
