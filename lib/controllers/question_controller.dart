import 'package:flutter/animation.dart';
import 'package:get/get.dart';

// We use get package for our state management
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our paln is to fill the progress bar within 60 s
    _animationController = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    );

    _animation = Tween(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    _animationController.forward();

    super.onInit();
  }
}
