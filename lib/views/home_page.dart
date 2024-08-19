import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resturant_app/constant/responsive.dart';
import 'package:resturant_app/data/local/data.dart';
import 'package:resturant_app/widgets/categories.dart';
import 'package:resturant_app/widgets/show_results.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _name = TextEditingController(text: "Restaurant");
  int currentIndex = 0;

  void selectedCategory(int cat) {
    setState(() {
      currentIndex = cat;
    });
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.init(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Warning",textAlign: TextAlign.center,),
                    content: Text("Are you sure you want to exit"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No"),
                          ),
                          SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              exit(0);
                            },
                            child: Text("Yes"),
                          ),
                        ],
                      )
                    ],
                  ));
        },
        child: SafeArea(
          child: Container(
            height: ResponsiveScreen.screen_height,
            width: ResponsiveScreen.screen_width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/bg.jpg"),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: ResponsiveScreen.screen_height * 0.30),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                ResponsiveScreen.screen_width * 0.08),
                            topRight: Radius.circular(
                                ResponsiveScreen.screen_width * 0.08),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                                height: ResponsiveScreen.screen_height * 0.19),
                            ...List.generate(foods.length, (i) {
                              if (currentIndex == i) {
                                return DisplayFood(food: foods[i]);
                              } else {
                                return Container();
                              }
                            }),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -ResponsiveScreen.screen_height * 0.07,
                        child: Container(
                          alignment: Alignment.center,
                          height: ResponsiveScreen.screen_height * 0.14,
                          width: ResponsiveScreen.screen_height * 0.14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              ResponsiveScreen.screen_height * 0.07,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/images/icon.webp"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ResponsiveScreen.screen_height * 0.07,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _name.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                        "Change Restaurant Name",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      content: TextField(
                                        controller: _name,
                                        decoration: InputDecoration(
                                          hintText: _name.text,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: MaterialButton(
                                              shape: const StadiumBorder(),
                                              color: Colors.orange,
                                              onPressed: () {
                                                if (_name.text
                                                    .trim()
                                                    .isNotEmpty) {
                                                  Navigator.of(context)
                                                      .maybePop();
                                                }
                                              },
                                              child: const Text("Save")),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Icon(Icons.edit)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: ResponsiveScreen.screen_height * 0.12,
                        child: DisplayCategories(
                          currentIndex: currentIndex,
                          changedValue: selectedCategory,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
