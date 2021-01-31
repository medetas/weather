import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalTime extends StatelessWidget {
  final String localTime;

  LocalTime({Key key, @required this.localTime})
      : assert(localTime != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('HH:mm').format(DateTime.parse(localTime))}',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    );
  }
}
