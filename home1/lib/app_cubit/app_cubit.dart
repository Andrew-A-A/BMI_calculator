import 'package:bloc/bloc.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  //Global variable to store the values
  double currentHeight = 150;
  double age=20;
  double weight=50;
  bool? isMale;

  void changeWeight(double value){
    weight=value;
    emit(ChangeWeightState());
  }
  void changeHeight(double value){
    currentHeight=value;
    emit(ChangerHeightState());
  }
  void changeGender(bool value){
    isMale=value;
    emit(ChangeGenderState());
  }
  void changeAge(double value){
    age=value;
    emit(ChangeAgeState());
  }
}