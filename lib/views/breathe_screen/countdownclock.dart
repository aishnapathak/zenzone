import 'dart:async';

import 'package:ecom/consts/consts.dart';

class CountdownClock extends StatefulWidget {
  final int durationInSeconds;
  final VoidCallback onCountdownComplete;

  CountdownClock({
    required this.durationInSeconds,
    required this.onCountdownComplete,
  });

  @override
  _CountdownClockState createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock> {
  late Timer _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _resetCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsRemaining--;
        if (_secondsRemaining <= 0) {
          _timer.cancel();
          _secondsRemaining = 0;
          widget.onCountdownComplete();
        }
      });
    });
  }

  void _stopCountdown() {
    _timer.cancel();
  }

  void _resetCountdown() {
    setState(() {
      _secondsRemaining = widget.durationInSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    final double progress = _secondsRemaining / widget.durationInSeconds;
    return Column(
      children: [
        (context.screenHeight * 0.1).heightBox,
        const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            'Practice mindful breathing daily!',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        SizedBox(height: 9),
        Expanded(
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [blueColor, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 5.5,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 1.5,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                Text(
                  '$_secondsRemaining',
                  style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Positioned(
                  top: 370,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _startCountdown,
                        child: const Text('Start'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _stopCountdown,
                        child: const Text('Stop'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _resetCountdown,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Exhale stress...',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        const Text(
          'Inhale calm...',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
