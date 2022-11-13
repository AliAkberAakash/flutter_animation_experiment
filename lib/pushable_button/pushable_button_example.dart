import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PushableButtonExample extends StatefulWidget {
  const PushableButtonExample({Key? key}) : super(key: key);

  @override
  State<PushableButtonExample> createState() => _PushableButtonExampleState();
}

class _PushableButtonExampleState extends State<PushableButtonExample>
  with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: SizedBox(
                    height: 190,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: AnimatedButton(
                            imageName: "gray_button",
                          ),
                        ),
                        Positioned(
                          top: 80,
                          child: AnimatedButton(
                            imageName: "gray_button",
                          ),
                        ),
                        Positioned(
                          left: 110,
                          child: AnimatedButton(
                            imageName: "gray_button",
                          ),
                        ),
                        Positioned(
                          left: 110,
                          top: 80,
                          child: AnimatedButton(
                            imageName: "gray_button",
                          ),
                        ),
                        Positioned(
                          left: 220,
                          child: AnimatedButton(
                            imageName: "gray_button",
                          ),
                        ),
                        Positioned(
                          left: 220,
                          top: 80,
                          child: AnimatedButton(
                            imageName: "gray_button",
                          ),
                        ),
                        Positioned(
                          top: 1500,
                          child: Container(
                            height: 10,
                            width: 300,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {

  final String imageName;

  const AnimatedButton({Key? key, required this.imageName}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
  with SingleTickerProviderStateMixin{

  final player = AudioPlayer();
  bool muted = false;

  void _playSound() {
    if (player.state == PlayerState.playing) {
      player.stop();
    }
    if (!muted) {
      player.play(AssetSource('assets_keyboard_tap_down.wav'));
    }
  }

  final _duration = const Duration(milliseconds: 500);

  late final AnimationController _animationController;
  late final Animation _goDownAnimation;
  late final Animation _comeUpAnimation;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _goDownAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    _comeUpAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    print("value of backward animation ${_comeUpAnimation.value}");

    _animationController.addListener(() {
      setState(() {});
      if(_animationController.isCompleted){
        _animationController.reset();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _animationController.forward();
        _playSound();
      },
      child: Padding(
        padding: EdgeInsets.only(top: (_goDownAnimation.value-_comeUpAnimation.value).toDouble()),
        child: Image.asset(
          "assets/${widget.imageName}.png",
          height: 100,
          width: 130,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

