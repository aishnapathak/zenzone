import 'package:ecom/consts/consts.dart';

import 'countdownclock.dart';

class BreatheScreen extends StatelessWidget {
  const BreatheScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 227, 227, 1),
      child: Center(
        child: CountdownClock(
          durationInSeconds:
              60, // Set the duration for the breathing exercise (60 seconds in this example)
          onCountdownComplete: () {
            // Add any logic you want to execute when the countdown is complete (breathing exercise is done).
            print('Countdown Complete!');
          },
        ),
      ),
    );
  }
}
