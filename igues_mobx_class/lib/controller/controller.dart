import 'package:mobx/mobx.dart';

class Controller {
  var numeroDeClicks = Observable(0);

  void _addClick(int qtd) {
    numeroDeClicks.value += qtd;
  }

  Action addClick;

  Controller() {
    addClick = Action(_addClick);
  }
}
