import 'package:flutter/material.dart';

class ShakerWidget extends StatefulWidget {

  final ShakeController shakeController;
  final Widget child;

  const ShakerWidget({
    Key? key,
    required this.shakeController,
    required this.child,
  }) : super(key: key);

  @override
  State<ShakerWidget> createState() => _ShakerWidgetState();
}

class _ShakerWidgetState extends State<ShakerWidget> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  late final Animation _translationAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _translationAnimation = Tween<double>(begin: 0, end: 24)
        .animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    widget.shakeController._onShakeListener = (){
      _controller.forward(from: 0);
    };

  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_getXOffset(_translationAnimation.value.toInt()),0),
      child: widget.child,
    );
  }

  double _getXOffset(int x){
    if(x==24){
      return 0;
    }
    if(x%3==0){
      if (x % 2 == 0) {
        return 5.00;
      }
      return -5.00;
    }

    return 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}

class ShakeController {
  void shake(){
    if(_onShakeListener != null){
      _onShakeListener!();
    }
  }
  Function()? _onShakeListener;
}
