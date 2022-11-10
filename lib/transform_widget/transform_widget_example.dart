import 'package:animation_experiment/menu_screen.dart';
import 'package:flutter/material.dart';

class TransformWidgetExample extends StatefulWidget {
  const TransformWidgetExample({Key? key}) : super(key: key);

  @override
  State<TransformWidgetExample> createState() => _TransformWidgetExampleState();
}

class _TransformWidgetExampleState extends State<TransformWidgetExample> {

  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4(
                1,0,0,0,
                0,1,0,0,
                0,0,1,0,
                0,0,0,1,
              )..rotateX(x)..rotateY(y)..rotateZ(z),
              alignment: FractionalOffset.center,
              child: GestureDetector(
                onPanUpdate: (details){
                  setState(() {
                    y = y - details.delta.dx / 100;
                    x = x - details.delta.dy / 100;
                  });
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.redAccent,
                ),
              ),
            ),
            const VSpacer(height: 150,),
            const Text("Drag the red square in X and Y axis")
          ],
        ),
      ),
    );
  }
}
