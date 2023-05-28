import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubits_state/weater_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class CubitWeather extends Cubit<WeatherState>{
  CubitWeather(this.weatherService) : super(InitialState());
  WeatherModel? weatherModel;
  String? cityname;
  WeatherService weatherService;
 void  getweather({required String cityname})async{
  emit(LoadingState());
   try{
     weatherModel= await weatherService.getWeather(cityName: cityname);
       emit(SuccessState()) ;
   }on Exception catch(e){
      emit(FailtureState());
   }
 }
}