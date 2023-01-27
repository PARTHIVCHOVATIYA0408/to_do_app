import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/model/to_do_model.dart';

import 'package:to_do_app/screens/data_enter_screen.dart';

import 'to_do_compate_screen.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  List<ToDoModel> listData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ToDoCompleteScreen(),
                ),
              );
            },
            icon: const Icon(Icons.check_box),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DataEnterScreen(),
            ),
          );

          if (data != null) {
            listData.add(data);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: listData.isEmpty
            ? const SizedBox(
                child: Center(
                  child: Text(
                    "Non data found",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  final item = listData[index];
                  return Slidable(
                    key: UniqueKey(),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () {
                          listData.add(item);
                          listData.removeAt(index);
                          setState(() {});
                        },
                      ),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          icon: Icons.check,
                          label: 'Complete',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                            dynamic data = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DataEnterScreen(
                                  item: item,
                                ),
                              ),
                            );

                            if (data != null) {
                              listData[index] = data;
                              setState(() {});
                            }
                          },
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.edit_rounded,
                          label: 'Edit',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            listData.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title :${item.title}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Date :${item.date}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Time :${item.time}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Discription :${item.description}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
