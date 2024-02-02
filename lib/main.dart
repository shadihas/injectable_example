import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hover Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Hover Demo'),
        ),
        body: Center(
          child: Container(
            child: HoverText(
              text: 'Hover over me!',
              hoverChild: Container(
                height: 100,
                width: 200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        print("first object");
                        // Close the tooltip when tapped
                       
                      },
                      child: const Text("icon arrow back"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print("second object");
                        // Close the tooltip when tapped 
                      },
                      child: const Text("icon arrow back"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  final String text;
  final Widget hoverChild;

  const HoverText({Key? key, required this.text, required this.hoverChild})
      : super(key: key);

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  JustTheController justTheController = JustTheController();

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      controller: justTheController,
      tailLength: 0,
      isModal: true,
      backgroundColor: Colors.blue,
      content: GestureDetector(
        onTap: () => _removeToolTip(),
        child: widget.hoverChild),
      preferredDirection: AxisDirection.right,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(child: Text(widget.text)),
      ),
    );
  }

  _removeToolTip() async {
    await justTheController.hideTooltip(immediately: true);
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Hover Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Hover Demo'),
//         ),
//         body: const Center(
//           child: HoverText(
//             text: 'Hover over me!',
//             hoverChild: Text('More info about this text'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HoverText extends StatefulWidget {
//   final String text;
//   final Widget hoverChild;

//   const HoverText({Key? key, required this.text, required this.hoverChild})
//       : super(key: key);

//   @override
//   _HoverTextState createState() => _HoverTextState();
// }

// class _HoverTextState extends State<HoverText> {
//   OverlayEntry? _overlayEntry;
//   final LayerLink _layerLink = LayerLink();
//   final GlobalKey _textKey = GlobalKey();

//   void _showOverlay(BuildContext context) {
//      final RenderBox renderBoxText = _textKey.currentContext?.findRenderObject() as RenderBox;
//     final positionText = renderBoxText.localToGlobal(Offset.zero);
//     final sizeText = renderBoxText.size;

//     // Position the overlay in the middle of the text
//     final overlayX = positionText.dx + sizeText.width / 2 - 100; // Assuming the dialog width is 200
//     final overlayY = positionText.dy + sizeText.height; // Position it below the text

//     _overlayEntry = _createOverlayEntry(context, overlayX, overlayY);
//     Overlay.of(context)?.insert(_overlayEntry!);
//   }

//   OverlayEntry _createOverlayEntry(
//       BuildContext context, overlayLeft, overlayTop) {
//     return OverlayEntry(
//       builder: (context) => Positioned(
//         left: overlayLeft,
//         top: overlayTop,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: const Offset(0, 20), // Adjust this value for positioning
//           child: CustomPaint(
//             painter: RoundedDialogPainter(),
//             child: Container(
//               width: 400, // Adjust the width as needed
//               height: 200, // Adjust the height as needed
//               padding:
//                   const EdgeInsets.only(top: 10), // Adjust for triangle size
//               alignment: Alignment.center,
//               child: widget.hoverChild,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: MouseRegion(
//         onEnter: (event) => _showOverlay(context),
//         onExit: (event) => _overlayEntry?.remove(),
//         child:  Text(widget.text, key: _textKey),
//       ),
//     );
//   }
// }

// class RoundedDialogPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.blue;
//     const triangleHeight = 20.0; // Height of the triangle
//     const triangleBaseHalfLength = 20.0; // Half the base length of the triangle
//     const radius = Radius.circular(8); // Radius for the rectangle corners
//     final path = Path();

//     // Start at the left corner of the triangle
//     path.moveTo(size.width / 2 - triangleBaseHalfLength, triangleHeight);

//     // Draw the triangle with sharp corners
//     path.lineTo(size.width / 2 - 3, 2);
//     path.lineTo(size.width / 2, 0);
//     path.lineTo(size.width / 2 + 3, 2);
//     path.lineTo(size.width / 2 + triangleBaseHalfLength, triangleHeight);
//     // Continue with the rectangle part with rounded corners
//     path.lineTo(size.width - radius.x,
//         triangleHeight); // top right corner of the rectangle
//     path.arcToPoint(
//       Offset(size.width, triangleHeight + radius.y),
//       radius: radius,
//       clockwise: true,
//     );
//     path.lineTo(size.width, size.height - radius.y); // bottom right corner
//     path.arcToPoint(
//       Offset(size.width - radius.x, size.height),
//       radius: radius,
//       clockwise: true,
//     );
//     path.lineTo(radius.x, size.height); // bottom left corner
//     path.arcToPoint(
//       Offset(0, size.height - radius.y),
//       radius: radius,
//       clockwise: true,
//     );
//     path.lineTo(
//         0, triangleHeight + radius.y); // top left corner of the rectangle
//     path.arcToPoint(
//       Offset(radius.x, triangleHeight),
//       radius: radius,
//       clockwise: true,
//     );

//     // Closing the path back to the start point of the triangle
//     path.close();

//     // Draw the path
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Hover Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Hover Demo'),
//         ),
//         body: Center(
//           child: HoverText(
//             text: 'Hover over me!',
//             hoverChild: Text('More info about this text'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HoverText extends StatefulWidget {
//   final String text;
//   final Widget hoverChild;

//   const HoverText({Key? key, required this.text, required this.hoverChild})
//       : super(key: key);

//   @override
//   _HoverTextState createState() => _HoverTextState();
// }

// class _HoverTextState extends State<HoverText> {
//   OverlayEntry? _overlayEntry;
//   final LayerLink _layerLink = LayerLink();

//   void _showOverlay(BuildContext context, Offset position) {
//     _overlayEntry = _createOverlayEntry(context, position);
//     Overlay.of(context)?.insert(_overlayEntry!);
//   }

//   OverlayEntry _createOverlayEntry(BuildContext context, Offset position) {
//     return OverlayEntry(
//       builder: (context) => Positioned(
//         left: position.dx,
//         top: position.dy,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: Offset(0, 20), // Adjust this value for positioning
//           child: CustomPaint(
//             painter: RoundedDialogPainter(),
//             child: Container(
//               width: 200, // Adjust the width as needed
//               height: 100, // Adjust the height as needed
//               padding: EdgeInsets.only(top: 10), // Adjust for triangle size
//               alignment: Alignment.center,
//               child: widget.hoverChild,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: MouseRegion(
//         onEnter: (event) => _showOverlay(context, event.position),
//         onExit: (event) => _overlayEntry?.remove(),
//         child: Text(widget.text),
//       ),
//     );
//   }
// }

// class RoundedDialogPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.white;
//     final radius = Radius.circular(4); // Adjust for desired roundness

//     // Draw the rectangle
//     final rect = Rect.fromLTWH(0, 10, size.width, size.height - 10);
//     final rrect = RRect.fromRectAndRadius(rect, radius);
//     canvas.drawRRect(rrect, paint);

//     // Draw the triangle with rounded corners
//     final path = Path();
//     path.moveTo(size.width / 2, 0);
//     path.lineTo(size.width / 2 - 10, 10);
//     path.arcToPoint(
//       Offset(size.width / 2 + 10, 10),
//       radius: radius,
//       clockwise: false,
//     );
//     path.lineTo(size.width / 2, 0);
//     path.close();
//     canvas.drawPath(path, paint);

//     // Optionally add a border
//     final borderPaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke;
//     canvas.drawRRect(rrect, borderPaint);
//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }


