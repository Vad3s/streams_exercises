import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    super.key,
    required this.timeRepository,
  });

  final TimeRepository timeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 209, 103),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 209, 103),
        title: const Text('Time Screen'),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: timeRepository.dateTimeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              DateTime currentTime = snapshot.data!;
              String date =
                  '${currentTime.day}-${currentTime.month}-${currentTime.year}';
              String time =
                  '${currentTime.hour}:${currentTime.minute}:${currentTime.second}';
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Date: $date',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Current Time: $time',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
