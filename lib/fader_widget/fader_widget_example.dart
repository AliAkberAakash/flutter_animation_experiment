import 'package:animation_experiment/menu_screen.dart';
import 'package:flutter/material.dart';

class FaderWidgetExample extends StatefulWidget {
  const FaderWidgetExample({Key? key}) : super(key: key);

  @override
  State<FaderWidgetExample> createState() => _FaderWidgetExampleState();
}

class _FaderWidgetExampleState extends State<FaderWidgetExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AnimatedWidth(curve: Curves.linear,),
            VSpacer(),

            AnimatedWidth(curve: Curves.bounceIn,),
            VSpacer(),
            AnimatedWidth(curve: Curves.bounceOut,),
            VSpacer(),
            AnimatedWidth(curve: Curves.bounceInOut,),
            VSpacer(),

            AnimatedWidth(curve: Curves.ease,),
            VSpacer(),
            AnimatedWidth(curve: Curves.easeIn,),
            VSpacer(),
            AnimatedWidth(curve: Curves.easeOut,),
            VSpacer(),
            AnimatedWidth(curve: Curves.easeInOut,),
            VSpacer(),

            AnimatedWidth(curve: Curves.fastOutSlowIn,),
            VSpacer(),
            AnimatedWidth(curve: Curves.easeInCirc,),
            VSpacer(),
            AnimatedWidth(curve: Curves.easeInOutCubicEmphasized,),
            VSpacer(),

          ],
        ),
      ),
    );
  }
}

class AnimatedWidth extends StatefulWidget {

  final Curve curve;
  const AnimatedWidth({Key? key, required this.curve}) : super(key: key);

  @override
  State<AnimatedWidth> createState() => _AnimatedWidthState();
}

class _AnimatedWidthState extends State<AnimatedWidth> {

  double _animationValue = 200;
  final Duration _animationDuration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          curve: widget.curve,
          width: _animationValue,
          duration: _animationDuration,
          child: const LinearProgressIndicator(
            value: 100,
            color: Colors.pink,
          ),
        ),
        const HSpacer(),
        MaterialButton(
          child: const Text("Animate"),
          onPressed: () async{
            setState(() {
              _animationValue = 0;
            });
            await Future.delayed(_animationDuration);
            setState(() {
              _animationValue = 200;
            });
          },
        ),
      ],
    );
  }
}
