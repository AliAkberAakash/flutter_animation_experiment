import 'package:animation_experiment/animated_text/animated_text_example.dart';
import 'package:animation_experiment/bouncing_ball/bouncing_ball_example.dart';
import 'package:animation_experiment/circular_animated_text/circular_animated_text_example.dart';
import 'package:animation_experiment/delayed_list/delayed_list_example.dart';
import 'package:animation_experiment/faded_screen/faded_screen_example.dart';
import 'package:animation_experiment/heart_beat_widget/heeart_beat_widget_example.dart';
import 'package:animation_experiment/pushable_button/pushable_button_example.dart';
import 'package:animation_experiment/resize_widget/resize_widget_example.dart';
import 'package:animation_experiment/shaker_widget/shaker_widget_example.dart';
import 'package:animation_experiment/transform_widget/transform_widget_example.dart';
import 'package:animation_experiment/view_helper/animation_item_ui_model.dart';
import 'package:flutter/material.dart';

final List<AnimationItemUIModel> viewList = [
  AnimationItemUIModel(
    screenWidget: const ResizeWidgetExample(),
    title: "Resize Widget",
  ),
  AnimationItemUIModel(
    screenWidget: const ShakerWidgetExample(),
    title: "Shaker Widget",
  ),
  AnimationItemUIModel(
    screenWidget: const AnimatedTextExample(),
    title: "Animated Text",
  ),
  AnimationItemUIModel(
    screenWidget: const DelayedListExample(),
    title: "Delayed List",
  ),
  AnimationItemUIModel(
    screenWidget: const FadedScreenExample(),
    title: "Faded Screen",
  ),
  AnimationItemUIModel(
    screenWidget: const HeartBeatWidgetExample(),
    title: "Heart Beat",
  ),
  AnimationItemUIModel(
    screenWidget: const BouncingBallExample(),
    title: "Bouncing Ball",
  ),
  AnimationItemUIModel(
    screenWidget: const PushableButtonExample(),
    title: "Pushable Button",
  ),
  AnimationItemUIModel(
    screenWidget: const CircularAnimatedTextExample(),
    title: "Circular Animated Text",
  ),
  AnimationItemUIModel(
    screenWidget: const TransformWidgetExample(),
    title: "Transform Widget",
  ),
];

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animation samples",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: viewList.length,
          itemBuilder: (ctx, idx) {
            return ListItemUi(
              animationItemUIModel: viewList[idx],
            );
          },
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

class ListItemUi extends StatelessWidget {
  final AnimationItemUIModel animationItemUIModel;

  const ListItemUi({
    Key? key,
    required this.animationItemUIModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            _getRoute(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            animationItemUIModel.title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Route _getRoute() {
    return PageRouteBuilder<SlideTransition>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            animationItemUIModel.screenWidget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween =
              Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero);
          final curveTween = CurveTween(curve: Curves.ease);

          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: child,
          );
        });
  }
}
