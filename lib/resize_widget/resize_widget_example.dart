import 'package:animation_experiment/menu_screen.dart';
import 'package:flutter/material.dart';

class ResizeWidgetExample extends StatefulWidget {
  const ResizeWidgetExample({Key? key}) : super(key: key);

  @override
  State<ResizeWidgetExample> createState() => _ResizeWidgetExampleState();
}

class _ResizeWidgetExampleState extends State<ResizeWidgetExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ResizeAnimateWidget(curve: Curves.linear,),
            VSpacer(),

            ResizeAnimateWidget(curve: Curves.bounceIn,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.bounceOut,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.bounceInOut,),
            VSpacer(),

            ResizeAnimateWidget(curve: Curves.ease,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.easeIn,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.easeOut,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.easeInOut,),
            VSpacer(),

            ResizeAnimateWidget(curve: Curves.fastOutSlowIn,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.easeInCirc,),
            VSpacer(),
            ResizeAnimateWidget(curve: Curves.easeInOutCubicEmphasized,),
            VSpacer(),

          ],
        ),
      ),
    );
  }
}

class ResizeAnimateWidget extends StatefulWidget {

  final Curve curve;
  const ResizeAnimateWidget({Key? key, required this.curve}) : super(key: key);

  @override
  State<ResizeAnimateWidget> createState() => _ResizeAnimateWidgetState();
}

class _ResizeAnimateWidgetState extends State<ResizeAnimateWidget> {

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
