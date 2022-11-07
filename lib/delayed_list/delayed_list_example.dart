import 'package:animation_experiment/menu_screen.dart';
import 'package:flutter/material.dart';

class DelayedListExample extends StatefulWidget {
  const DelayedListExample({Key? key}) : super(key: key);

  @override
  State<DelayedListExample> createState() => _DelayedListExampleState();
}

class _DelayedListExampleState extends State<DelayedListExample>
  with TickerProviderStateMixin{

  final _duration = const Duration(milliseconds: 500);

  late final AnimationController _animationController;
  late final Animation _sizeAnimation;
  late final Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: _duration);
    _sizeAnimation = Tween<double>(begin: 50, end: 0).animate(_animationController);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delayed ListView"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (ctx, idx){
          return Padding(
            padding: EdgeInsets.only(top: _getTopPadding(idx)),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: const CardItem(),
            ),
          );
        }
      ),
    );
  }

  double _getTopPadding(int idx){

    double tmp = _sizeAnimation.value - idx+1;

    if(tmp<0) {
      tmp = 0;
    }

    return tmp;
  }

}

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "This is a title",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            VSpacer(),
            const Text(
              "This is the body",
            ),
          ],
        ),
      ),
    );
  }
}

