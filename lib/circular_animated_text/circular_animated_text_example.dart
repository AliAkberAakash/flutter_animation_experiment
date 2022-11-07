import 'package:animation_experiment/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';

class CircularAnimatedTextExample extends StatefulWidget {
  const CircularAnimatedTextExample({Key? key}) : super(key: key);

  @override
  State<CircularAnimatedTextExample> createState() => _CircularAnimatedTextExampleState();
}

class _CircularAnimatedTextExampleState extends State<CircularAnimatedTextExample>   with SingleTickerProviderStateMixin{

  final _duration = const Duration(milliseconds: 1000);

  late final AnimationController _animationController;
  late final Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: _duration);
    _fadeAnimation = Tween<double>(begin: 0, end: 180).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularText(
              children: [
                // TextItem(
                //   text: Text(
                //     "Circular text".toUpperCase(),
                //     style: const TextStyle(
                //       fontSize: 16,
                //       color: Colors.blue,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   space: 10,
                //   startAngle: (90-_fadeAnimation.value).toDouble(),
                //   startAngleAlignment: StartAngleAlignment.center,
                //   direction: CircularTextDirection.clockwise,
                // ),
                TextItem(
                  text: Text(
                    "Rotated text".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  space: 10,
                  startAngle: (_fadeAnimation.value-90).toDouble(),
                  startAngleAlignment: StartAngleAlignment.center,
                  direction: CircularTextDirection.clockwise,
                ),
              ],
            ),
            const VSpacer(height: 30,),
            MaterialButton(
              color: Colors.lightGreenAccent,
              child: const Text("Rotate"),
              onPressed: (){
                if(_fadeAnimation.value == 180) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}
