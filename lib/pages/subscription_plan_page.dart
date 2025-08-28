import 'package:flutter/material.dart';
import 'package:subscription/themes/light_mode.dart';

class SubscriptionPlanPage extends StatelessWidget {
  const SubscriptionPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightMode.colorScheme.secondary,
            ),
            child: Icon(Icons.arrow_back_outlined, color: Colors.black54),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Subscription plan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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

            // starter plan card.
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                // color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.deepPurple.shade400,
                    Colors.deepPurple.shade200,
                  ],
                ),
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
                      Icon(
                        Icons.window_rounded,
                        color: Colors.white,
                        size: 50,
                      ),

                      const Spacer(),

                      // included.
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white38,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            "Included",
                            style: TextStyle(color: Colors.grey.shade100),
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
                        "Starter Plan",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        "\$15.99",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "Seamless client experiences",
                        style: TextStyle(color: Colors.white60),
                      ),
                      const Spacer(),
                      Text(
                        "\$18.99",
                        style: TextStyle(
                          color: Colors.white60,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white60,
                          decorationThickness: 3
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Features",
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16
                    ),
                  ),

                  const SizedBox(height: 15),
                  feature("Unlimited clients and projects"),
                  const SizedBox(height: 5),

                  feature("Invoices and payment"),
                  const SizedBox(height: 5),

                  feature("Proposals and contract"),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// function for features.
Widget feature (String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.white60,
        size: 20,
      ),
      const SizedBox(width: 5),
      Text(
        text,
        style: TextStyle(
          color: Colors.white60,
        ),
      )
    ],
  );
}