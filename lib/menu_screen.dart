import 'package:animation_experiment/fader_widget/fader_widget_example.dart';
import 'package:animation_experiment/shaker_widget/shaker_widget_example.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavigatorButton(
              screenWidget: ShakerWidgetExample(),
              title: "Shaker Widget Example",
              color: Colors.orangeAccent,
            ),
            VSpacer(),
            NavigatorButton(
              screenWidget: FaderWidgetExample(),
              title: "Fader Widget Example",
              color: Colors.pink,
            ),
            VSpacer(),
          ],
        ),
      ),
    );
  }
}

class VSpacer extends StatelessWidget {

  final double height;
  const VSpacer({Key? key, this.height = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HSpacer extends StatelessWidget {

  final double width;
  const HSpacer({Key? key, this.width = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class NavigatorButton extends StatelessWidget {

  final Widget screenWidget;
  final String title;
  final Color color;
  final Color textColor;

  const NavigatorButton({
    Key? key,
    required this.screenWidget,
    required this.title,
    this.color = Colors.lightBlueAccent,
    this.textColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=> screenWidget,
          ),
        );
      },
    );
  }
}

