import 'package:flutter/material.dart';
import 'package:subscription/pages/payment_methods_page.dart';
import 'package:subscription/themes/light_mode.dart';

class PlanCard extends StatelessWidget {
  final Map<String, dynamic> plan;
  final bool starterPlan;
  const PlanCard({super.key, required this.plan, this.starterPlan = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the payment page.
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => PaymentMethodsPage(plan: plan)),
        );
      },
      child: Container(
        height: 300,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: starterPlan ? null : lightMode.colorScheme.secondary,
          borderRadius: BorderRadius.circular(25),
          gradient: starterPlan
              ? LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.deepPurple.shade400,
                    Colors.deepPurple.shade200,
                  ],
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // crown icon.
                Image.asset(
                  'assets/icons/crown.png',
                  height: 40,
                  width: 40,
                  color: starterPlan ? Colors.white60 : Colors.black,
                ),

                const Spacer(),

                // included.
                Container(
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: starterPlan ? Colors.transparent : Colors.grey[350],
                    border: Border.all(
                      color: Colors.white60,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Included",
                      style: TextStyle(color: starterPlan ? Colors.white : Colors.grey.shade800),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // plan info.
            Row(
              children: [
                Text(
                  plan['plan']!,
                  style: TextStyle(color: starterPlan ? Colors.white : Colors.black, fontSize: 20),
                ),
                const Spacer(),
                Text(
                  "\$${plan['price']}",
                  style: TextStyle(color: starterPlan ? Colors.white : Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Row(
              children: [
                Text(
                  plan['description']!,
                  style: TextStyle(color: starterPlan ? Colors.white60 : Colors.black54, fontSize: 16),
                ),
                const Spacer(),
                Text(
                  "\$${plan['priceBeforeDiscount']}",
                  style: TextStyle(
                    color: starterPlan ? Colors.white60 : Colors.black54,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: starterPlan ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              "Features",
              style: TextStyle(color: starterPlan ? Colors.white : Colors.black, fontSize: 18),
            ),

            const SizedBox(height: 15),
            feature(plan['features'][0], starterPlan ? true : false),
            const SizedBox(height: 5),

            feature(plan['features'][1], starterPlan ? true : false),
            const SizedBox(height: 5),

            feature(plan['features'][2], starterPlan ? true : false),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

// function for features.
Widget feature(String text, bool starterPlan) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.check_circle_outline_rounded,
        color: starterPlan ? Colors.white70 : Colors.black54,
        size: 20,
      ),
      const SizedBox(width: 5),
      Text(
        text,
        style: TextStyle(color: starterPlan ? Colors.white70 : Colors.black54),
      ),
    ],
  );
}
