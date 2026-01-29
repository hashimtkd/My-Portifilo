import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:animate_do/animate_do.dart';

class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> {
  late AnimationController _controller;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          _isVisible = true;
          _controller.forward();
        }
      },
      child: FadeInUp(
        manualTrigger: true,
        controller: (controller) => _controller = controller,
        delay: widget.delay,
        child: widget.child,
      ),
    );
  }
}
