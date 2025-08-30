import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:subscription/widgets/payment_method_tile.dart';

class PaymentMethodsPage extends StatelessWidget {
  // get the plan from plans page.
  // final plan;
  const PaymentMethodsPage({
    super.key,
    // required this.plan
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[350],
          ),
          child: Icon(Icons.arrow_back_outlined, color: Colors.black54),
        ),
        centerTitle: true,
        title: Text("Subscription", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
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
                      "Starter Plan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // subtitle.
                    Text(
                      "Seamless client experiences",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // payment methods.
              Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              /// methods.
              // mastercard.
              const PaymentMethodTile(
                icon: "assets/icons/mastercard.svg.png",
                method: "Mastercard",
                fill: true,
              ),
              const SizedBox(height: 15),

              // paypal.
              const PaymentMethodTile(
                icon: "assets/icons/paypal.png",
                method: "PayPal",
              ),
              const SizedBox(height: 15),

              // google pay.
              const PaymentMethodTile(
                icon: "assets/icons/google.png",
                method: "Google Pay",
              ),
              const SizedBox(height: 15),

              // apple pay.
              const PaymentMethodTile(
                icon: "assets/icons/apple.png",
                method: "Apple Pay",
              ),
              const SizedBox(height: 50),

              // continue button.
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 1, 78, 222),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
