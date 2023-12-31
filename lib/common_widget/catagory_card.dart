import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';

class CategoryCard extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;

  const CategoryCard({
    super.key,
    required this.pObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: (pObj["color"] as Color? ?? TColor.primary).withOpacity(0.3),
          // border:
          //     Border.all(color: TColor.placeholder.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  pObj['icon'],
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    pObj["name"],
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
