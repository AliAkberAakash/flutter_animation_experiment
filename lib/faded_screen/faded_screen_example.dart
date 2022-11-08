import 'package:flutter/material.dart';

class FadedScreenExample extends StatefulWidget {
  const FadedScreenExample({Key? key}) : super(key: key);

  @override
  State<FadedScreenExample> createState() => _FadedScreenExampleState();
}

class _FadedScreenExampleState extends State<FadedScreenExample>
  with SingleTickerProviderStateMixin{

  final _duration = const Duration(milliseconds: 2000);

  late final AnimationController _animationController;
  late final Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: _duration);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Opacity(
        opacity: _fadeAnimation.value,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is a text",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                "This is a text",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                "This is a text",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "This is a text",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "This is a text",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
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
