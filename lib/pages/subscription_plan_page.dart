import 'package:flutter/material.dart';
import 'package:subscription/themes/light_mode.dart';
import 'package:subscription/widgets/plan_card.dart';

// ignore: must_be_immutable
class SubscriptionPlanPage extends StatelessWidget {
  SubscriptionPlanPage({super.key});

  // plans.
  List<Map<String, dynamic>> plans = [
    {
      // Starter plan.
      "plan": "Starter Plan",
      "description": "Seamless client experiences",
      "features": [
        "Unlimited clients and projects",
        "Invoices and payment",
        "Proposals and contract",
      ],
      "price": 15.99.toString(),
      "priceBeforeDiscount": 18.99.toString(),
    },
    {
      // Essentials plan.
      "plan": "Essentials Plan",
      "description": "Productivity & automation tools",
      "features": [
        "Remove powered by Honeybook",
        "Expense management",
        "QuickBooks online integration",
      ],
      "price": 18.99.toString(),
      "priceBeforeDiscount": 22.99.toString(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Subscription plan"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // subscription method -> monthly | yearly.
            Container(
              height: 50,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: lightMode.colorScheme.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // monthly.
                  Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 101, 225),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Monthly',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  const Spacer(),

                  // yaerly.
                  Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Yearly',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Starter plan.
            PlanCard(plan: plans[0], starterPlan: true,),

            const SizedBox(height: 25),

            // Essentials plan.
            PlanCard(plan: plans[1]),

            const SizedBox(height: 25),

            // Another plan.
            PlanCard(plan: plans[1]),
          ],
        ),
      ),
    );
  }
}
