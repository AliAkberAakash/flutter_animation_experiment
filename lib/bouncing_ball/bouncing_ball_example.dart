import 'package:flutter/material.dart';

class BouncingBallExample extends StatefulWidget {
  const BouncingBallExample({Key? key}) : super(key: key);

  @override
  State<BouncingBallExample> createState() => _BouncingBallExampleState();
}

class _BouncingBallExampleState extends State<BouncingBallExample>
  with SingleTickerProviderStateMixin{

  final _duration = const Duration(milliseconds: 1000);

  late final AnimationController _animationController;
  late final Animation _bounceAnimationForward;
  late final Animation _bounceAnimationBackward;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _bounceAnimationForward = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    _bounceAnimationBackward = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

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
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: (){
                _animationController.repeat();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: (10 * (_bounceAnimationForward.value+_bounceAnimationBackward.value)).toDouble(),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.lightGreenAccent,
                  radius: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black54,
                  width: 100,
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

  double _calculateHeight(){
    return (100+_bounceAnimationForward.value-_bounceAnimationBackward.value).toDouble();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}
