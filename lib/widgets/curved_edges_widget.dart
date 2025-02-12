import 'package:depot_boisson/widgets/curved_edges.dart';
import 'package:flutter/material.dart';


class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomeCurvedEdges(),
      child: child,
      
    );
  }
}