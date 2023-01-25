import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/screens/data_enter_screen.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DataEnterScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Slidable(
          startActionPane: ActionPane(
            key: const ValueKey(0),
            motion: const ScrollMotion(),
            // dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                backgroundColor: const Color.fromARGB(255, 89, 0, 255),
                foregroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                icon: Icons.edit_rounded,
                label: 'Edit',
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataEnterScreen(),
                    ),
                  );
                },
              ),
              // SlidableAction(
              //   backgroundColor: const Color(0xFF21B7CA),
              //   foregroundColor: Colors.white,
              //   icon: Icons.check_box_outline_blank_outlined,
              //   label: 'cheak',
              //   onPressed: (BuildContext context) {},
              // ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              // SlidableAction(
              //   flex: 2,
              //   backgroundColor: const Color(0xFF7BC043),
              //   foregroundColor: Colors.white,
              //   icon: Icons.archive,
              //   label: 'Archive',
              //   onPressed: (BuildContext context) {},
              // ),
              SlidableAction(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                backgroundColor: const Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.save,
                label: 'Save',
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(36, 8, 0, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Title :",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Date :",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Time :",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Discription :",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
