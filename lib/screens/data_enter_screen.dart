import 'package:flutter/material.dart';

class DataEnterScreen extends StatefulWidget {
  const DataEnterScreen({super.key});

  @override
  State<DataEnterScreen> createState() => _DataEnterScreenState();
}

class _DataEnterScreenState extends State<DataEnterScreen> {
  TextEditingController textEditingController = TextEditingController();

  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO App"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autofocus: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                prefixIcon: const Icon(Icons.title_rounded),
                labelText: "Enter Title...",
                focusColor: Colors.amber,
              ),
            ),
            // Row(
            //   children: [
            //     Text(
            //       "${date.day}/${date.month}/${date.year}",
            //       style: const TextStyle(fontSize: 28),
            //     ),
            //     ElevatedButton(
            //       onPressed: () async {
            //         DateTime? newDate = await showDatePicker(
            //           context: context,
            //           initialDate: date,
            //           firstDate: DateTime(1900),
            //           lastDate: DateTime(2050),
            //         );
            //         if (newDate == null) return;
            //         setState(
            //           () => date = newDate,
            //         );
            //       },
            //       child: const Text("Select Date"),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
