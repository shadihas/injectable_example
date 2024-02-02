import 'package:flutter/material.dart';

class NavigationOverLay extends StatefulWidget {
  final String text;
  final Widget hoverChild;

  const NavigationOverLay(
      {Key? key, required this.text, required this.hoverChild})
      : super(key: key);

  @override
  _NavigationOverLayState createState() => _NavigationOverLayState();
}

class _NavigationOverLayState extends State<NavigationOverLay> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showOverlay(BuildContext context, Offset position) {
    _overlayEntry = _createOverlayEntry(context, position);
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(BuildContext context, Offset position) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 20), // Adjust this value for positioning
          child: Container(
            width: 200, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            padding: const EdgeInsets.only(top: 10), // Adjust for triangle size
            alignment: Alignment.center,
            child: widget.hoverChild,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (event) => _showOverlay(context, event.position),
        onExit: (event) => _overlayEntry?.remove(),
        child: Text(widget.text),
      ),
    );
  }
}
