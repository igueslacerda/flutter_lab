import 'package:mobx/mobx.dart';
part 'gencontroller.g.dart';

class GenController = GenControllerBase with _$GenController;

abstract class GenControllerBase with Store {
  @observable
  int numeroDeClicks = 0;

  @action
  addClick() {
    numeroDeClicks++;
  }
}
