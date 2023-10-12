import 'package:flutter/material.dart';
import 'package:oneline_grocery/common/color_extension.dart';

class ExploreCard extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;

  const ExploreCard({
    super.key,
    required this.pObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var color = (pObj["color"] as Color? ?? TColor.primary);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          border:
              Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  pObj['icon'],
                  width: 120,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            const Spacer(),

            Text(
              pObj["name"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
