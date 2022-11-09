import 'package:flutter/material.dart';

class HeartBeatWidgetExample extends StatefulWidget {
  const HeartBeatWidgetExample({Key? key}) : super(key: key);

  @override
  State<HeartBeatWidgetExample> createState() => _HeartBeatWidgetExampleState();
}

class _HeartBeatWidgetExampleState extends State<HeartBeatWidgetExample>
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

    _bounceAnimationForward = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.3,
          curve: Curves.easeIn,
        ),
      ),
    );

    _bounceAnimationBackward = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.3,
          0.6,
          curve: Curves.easeOut,
        ),
      ),
    );

    print("value of backward animation ${_bounceAnimationBackward.value}");

    _animationController.addListener(() {
      setState(() {});
      // if(_animationController.isCompleted){
      //   _animationController.reset();
      // }
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
            GestureDetector(
              onTap: (){
                _animationController.repeat();
              },
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent,
                size: _calculateHeight(),
              ),
            ),
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
