import 'package:depot_boisson/widgets/circular_container';
import 'package:depot_boisson/widgets/curved_edges_widget.dart';
import 'package:flutter/material.dart';

class TPrimaryHeader extends StatelessWidget {
  const TPrimaryHeader({super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child: TCircularContainner(backgroundColor: Colors.white.withOpacity(0.1),),),
              Positioned(top: -100, right: -400, child: TCircularContainner(backgroundColor: Colors.white.withOpacity(0.1),),),
              Positioned(top: 100, right: -200, child: TCircularContainner(backgroundColor: Colors.white.withOpacity(0.1),),),
              child,
            ],
          ),
        ),
      ),
    );
  }
}