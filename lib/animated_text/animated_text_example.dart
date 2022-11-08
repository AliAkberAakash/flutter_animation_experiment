import 'package:flutter/material.dart';

class AnimatedTextExample extends StatefulWidget {
  const AnimatedTextExample({Key? key}) : super(key: key);

  @override
  State<AnimatedTextExample> createState() => _AnimatedTextExampleState();
}

class _AnimatedTextExampleState extends State<AnimatedTextExample>
  with SingleTickerProviderStateMixin{

  final _text = "This is an animated text";
  late final Duration _duration;
  late final AnimationController _controller;
  late final Animation _textAnimation;

  int i = 1;
  var animatedText = "";
  final constVal  = 1000;

  void _initializeAnimation(){

    _duration = Duration(milliseconds: 80 * _text.length);

    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _textAnimation = Tween<double>(begin: 0, end: (constVal * _text.length).toDouble()).animate(_controller);

    final dividerConst = (1/_text.length.toDouble());

    _controller.addListener(() {

      setState(() {
        if(i-1<_text.length &&
            _getRoundedInt(_textAnimation.value.toInt()) == i*constVal){
          animatedText += _text[i-1];
          i++;
        }
        print("actual value ${_textAnimation.value.toInt()}");
        print("comparing: ${(i*constVal)}");
        print("animation value: ${_getRoundedInt(_textAnimation.value.toInt())}");
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _getRoundedInt(int num){
    return constVal*(num/constVal).toInt();
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              animatedText,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
