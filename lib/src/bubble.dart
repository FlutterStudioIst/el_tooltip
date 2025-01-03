import 'package:flutter/material.dart';

import 'element_box.dart';

/// Bubble serves as the tooltip container
class Bubble extends StatefulWidget {
  final Color color;
  final EdgeInsetsGeometry padding;
  final double maxWidth;
  final ElementBox triggerBox;
  final BorderRadiusGeometry? radius;
  final Widget child;
  /// [contentWrapBuilder] Builder that wraps the content
  final TransitionBuilder? contentWrapBuilder;

  const Bubble({
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(10.0),
    this.radius = const BorderRadius.all(Radius.circular(0)),
    required this.child,
    required this.triggerBox,
    this.maxWidth = 300.0,
    this.contentWrapBuilder,
    super.key,
  });

  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      decoration: BoxDecoration(
        borderRadius: widget.radius,
        color: widget.color,
      ),
      padding: widget.padding,
      child: widget.child,
    );
    if (widget.contentWrapBuilder != null) {
      content = widget.contentWrapBuilder!(context, content);
    }
    return Material(
      color: Colors.transparent,
      child: Opacity(
        opacity: 1.0,
        child: content,
      ),
    );
  }
}
