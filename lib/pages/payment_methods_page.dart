import 'package:flutter/material.dart';
import 'package:subscription/pages/subscription_pay_page.dart';
import 'package:subscription/widgets/payment_method_tile.dart';
import 'package:subscription/widgets/plans_icon.dart';

// ignore: must_be_immutable
class PaymentMethodsPage extends StatelessWidget {
  final Map<String, dynamic> plan;
  PaymentMethodsPage({super.key, required this.plan});

  // user active card (master card).
  Map<String, String> mastercardInfo = {
    "cardNumber": "5156 2402 5337 7173",
    "ownerName": "Jane Fox",
    "expiresOn": "02/28",
  };

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
                    // Plans icon.
                    PlansIcon(),

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

              const SizedBox(height: 25),

              // payment methods.
              Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              /// methods.
              // mastercard.
              PaymentMethodTile(
                icon: "assets/icons/mastercard.svg.png",
                method: mastercardInfo['cardNumber'],
                fill: true,
              ),
              const SizedBox(height: 15),

              // paypal.
              PaymentMethodTile(
                icon: "assets/icons/paypal.png",
                method: "PayPal",
              ),
              const SizedBox(height: 15),

              // google pay.
              PaymentMethodTile(
                icon: "assets/icons/google.png",
                method: "Google Pay",
              ),
              const SizedBox(height: 15),

              // apple pay.
              PaymentMethodTile(
                icon: "assets/icons/apple.png",
                method: "Apple Pay",
              ),

              const SizedBox(height: 30),

              // continue button.
              GestureDetector(
                onTap: () {
                  // navigate to the subscription page.
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SubscriptionPage(plan: plan, card: mastercardInfo,))
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(211, 1, 78, 222),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
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
