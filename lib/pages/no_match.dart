import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoMatchFound extends StatelessWidget {
  const NoMatchFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Lottie.asset(
                'assets/football.json',
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
              'No Match Found',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Jersey'
            ),
          ),
        ],
      ),
    );
  }
}
