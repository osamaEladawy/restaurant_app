import 'package:flutter/material.dart';
import 'package:resturant_app/constant/responsive.dart';
import 'package:resturant_app/data/local/categories.dart';

class DisplayCategories extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> changedValue;
  const DisplayCategories({
    super.key,
    required this.currentIndex,
    required this.changedValue,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.init(context);
    return SizedBox(
      height: ResponsiveScreen.screen_height * 0.06,
      width: ResponsiveScreen.screen_width,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                return changedValue(index);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: ResponsiveScreen.screen_width * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == index ? Colors.grey : Colors.orange),
                child: Text(
                  "${categories[index]['name']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
