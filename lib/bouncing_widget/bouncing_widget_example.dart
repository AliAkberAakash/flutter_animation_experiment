import 'package:flutter/material.dart';

class BouncingWidgetExample extends StatefulWidget {
  const BouncingWidgetExample({Key? key}) : super(key: key);

  @override
  State<BouncingWidgetExample> createState() => _BouncingWidgetExampleState();
}

class _BouncingWidgetExampleState extends State<BouncingWidgetExample>
    with SingleTickerProviderStateMixin{

  final _duration = const Duration(milliseconds: 100);

  late final AnimationController _animationController;
  late final Animation _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _bounceAnimation = Tween<double>(begin: 0, end: 20).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
      if(_animationController.isCompleted){
        _animationController.reverse();
      }
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
                _animationController.forward();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: _calculateHeight(),
                width: _calculateHeight(),
              ),
            ),
          ],
        ),
      ),
    );

  }

  double _calculateHeight(){
    return (100+_bounceAnimation.value).toDouble();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
