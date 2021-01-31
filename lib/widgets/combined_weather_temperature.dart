import 'package:flutter/material.dart';

import 'package:weather/models/models.dart' as model;
import 'package:weather/widgets/widgets.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final model.Weather weather;

  CombinedWeatherTemperature({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: WeatherConditions(condition: weather.condition),
              ),
              Center(
                child: Text(
                  weather.formattedCondition,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/thermometer.png'),
                title: Text(
                  '${(weather.temp).round()}°',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'max ${(weather.maxTemp).round()}°, min ${(weather.minTemp).round()}°',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: RotationTransition(
                    turns:
                        new AlwaysStoppedAnimation(weather.windDirection / 360),
                    child: Image.asset('assets/arrow.png')),
                title: Text(
                  '${(weather.windSpeed).round()} mph',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
