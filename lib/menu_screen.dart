import 'package:animation_experiment/animated_text/animated_text_example.dart';
import 'package:animation_experiment/bouncing_ball/bouncing_ball_example.dart';
import 'package:animation_experiment/circular_animated_text/circular_animated_text_example.dart';
import 'package:animation_experiment/delayed_list/delayed_list_example.dart';
import 'package:animation_experiment/faded_screen/faded_screen_example.dart';
import 'package:animation_experiment/heart_beat_widget/heeart_beat_widget_example.dart';
import 'package:animation_experiment/resize_widget/resize_widget_example.dart';
import 'package:animation_experiment/shaker_widget/shaker_widget_example.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavigatorButton(
              screenWidget: ShakerWidgetExample(),
              title: "Shaker Widget",
              color: Colors.orangeAccent,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: ResizeWidgetExample(),
              title: "Resize Widget",
              color: Colors.pink,
              textColor: Colors.white,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: DelayedListExample(),
              title: "Delayed List",
              color: Colors.blueGrey,
              textColor: Colors.white,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: FadedScreenExample(),
              title: "Faded Screen",
              color: Colors.deepPurpleAccent,
              textColor: Colors.white,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: CircularAnimatedTextExample(),
              title: "Circular Animated Text",
              color: Colors.lightGreenAccent,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: HeartBeatWidgetExample(),
              title: "Heart Beat",
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: AnimatedTextExample(),
              title: "Animated Text",
              color: Colors.brown,
              textColor: Colors.white,
            ),
            VSpacer(),

            NavigatorButton(
              screenWidget: BouncingBallExample(),
              title: "Bouncing Ball",
              color: Colors.brown,
              textColor: Colors.white,
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
      minWidth: double.infinity,
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

