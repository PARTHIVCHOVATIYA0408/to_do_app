import 'package:flutter/material.dart';

class DatePickerLearning extends StatefulWidget {
  const DatePickerLearning({Key? key}) : super(key: key);

  @override
  State<DatePickerLearning> createState() => _DatePickerLearningState();
}

class _DatePickerLearningState extends State<DatePickerLearning> {
  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date_Picker_Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${date.day}/${date.month}/${date.year}",
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050),
                );
                if (newDate == null) return;
                setState(
                  () => date = newDate,
                );
              },
              child: const Text("Select Date"),
            ),
          ],
        ),
      ),
    );
  }
}
