import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:subscription/widgets/price_tile.dart';

class SubscriptionPage extends StatelessWidget {
  final Map<String, dynamic> plan;
  final Map<String, String> card;
  const SubscriptionPage({super.key, required this.plan, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[350],
            ),
            child: Icon(Icons.arrow_back_outlined, color: Colors.black54),
          ),
        ),
        centerTitle: true,
        title: Text("Subscription", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // plan icon & name.
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      padding: EdgeInsets.all(3), // border width
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin:
                              AlignmentGeometry.topCenter, // gradient border.
                          end: AlignmentGeometry.bottomCenter,
                          colors: [
                            Colors.blue.shade600,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(style: BorderStyle.solid),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade600,
                            blurRadius: 8,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Container(
                        // inner container.
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white, // inner color.
                          shape: BoxShape.circle,
                        ),
                        child: Shimmer.fromColors(
                          baseColor: Colors.deepPurple,
                          highlightColor: Colors.blue.shade500,
                          direction: ShimmerDirection.ltr,
                          child: Image.asset(
                            "assets/icons/crown.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // plan name.
                    Text(
                      plan['plan'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // subtitle.
                    Text(
                      plan['description'],
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // card + card information.
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.black,
                      Colors.grey.shade900,
                      Colors.grey.shade800,
                    ],
                    stops: const [0.8, 0.5, 1],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mastercard name + icon.
                    Row(
                      children: [
                        // MASTERCARD.
                        Text(
                          "MASTERCARD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Spacer(),

                        // MASTERCARD ICON.
                        Image.asset(
                          "assets/icons/mastercard_icon.png",
                          height: 45,
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Card SIM + Network icon.
                    Row(
                      children: [
                        // Card SIM.
                        Image.asset("assets/icons/SIM.png", height: 45),

                        const Spacer(),

                        //Network icon.
                        Transform.rotate(
                          angle: pi / 2, // rotate the child.
                          child: Image.asset(
                            "assets/icons/wifi.png",
                            height: 30,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Card number.
                    Text(
                      card['cardNumber']!,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),

                    const SizedBox(height: 5),

                    /// Card owner + Expired date.
                    Row(
                      children: [
                        // Card owner.
                        Text(
                          card['ownerName']!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[300],
                          ),
                        ),

                        const SizedBox(width: 25),

                        Text(
                          "VALID\nTHRU",
                          style: TextStyle(
                            color: Colors.grey[350],
                            fontSize: 8,
                          ),
                        ),

                        const SizedBox(width: 5),

                        // Expired date.
                        Text(
                          card['expiresOn']!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Amount + Tax + Total prices.

              // Amount.
              PriceTile(text: "Amount", price: plan['price']),

              const SizedBox(height: 20),

              // Tax.
              PriceTile(text: "Tax", price: 1.99.toString()),

              const SizedBox(height: 20),

              Divider(color: Colors.black12),

              const SizedBox(height: 20),

              // Total.
              PriceTile(text: "Total", price: (double.parse(plan['price']) + 1.99).toStringAsFixed(2), total: true),

              const SizedBox(height: 30),

              // Get subscription button.
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(211, 1, 78, 222),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Get Subscription",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
