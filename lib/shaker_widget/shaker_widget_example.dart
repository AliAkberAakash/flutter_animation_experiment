import 'package:animation_experiment/shaker_widget/shaker_widget.dart';
import 'package:flutter/material.dart';

class ShakerWidgetExample extends StatefulWidget {
  const ShakerWidgetExample({Key? key}) : super(key: key);

  @override
  State<ShakerWidgetExample> createState() => _ShakerWidgetExampleState();
}

class _ShakerWidgetExampleState extends State<ShakerWidgetExample> {

  final ShakeController _shakeController = ShakeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ShakerWidget(
                shakeController: _shakeController,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blueAccent,
                    child: const Text(
                      "Shake",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: (){
                    _shakeController.shake();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

