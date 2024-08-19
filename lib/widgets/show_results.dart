import 'package:flutter/material.dart';
import 'package:resturant_app/constant/constant.dart';
import 'package:resturant_app/data/models/food.dart';

class DisplayFood extends StatelessWidget {
  final List<Food> food;
  const DisplayFood({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemCount: food.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      food[index].imageUrl,
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.grey.withOpacity(0.6),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          food[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: foodName,
                        ),
                        Text(
                          "${food[index].gram} mg",
                          style: foodGm,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: Text(
                            "${food[index].salary}\$",
                            style: foodGm,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
