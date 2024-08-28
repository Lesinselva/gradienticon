library grandienticon;

import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Color startColor;
  final Color endColor;

  const GradientIcon({
    super.key,
    required this.icon,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(25, 48),
      painter: GradientIconPainter(icon, startColor, endColor),
    );
  }
}

class GradientIconPainter extends CustomPainter {
  final IconData icon;
  final Color startColor;
  final Color endColor;

  GradientIconPainter(this.icon, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      fontSize: size.width,
      fontFamily: 'MaterialIcons',
      foreground: Paint()
        ..shader = LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    final textSpan = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final offset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
