

import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final String icon;
  final String? method;
  final bool fill;
  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.method,
    this.fill = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // method icon.
          Image.asset(
            icon,
            height: 25,
            width: 25,
          ),

          const SizedBox(width: 15),

          // method name.
          Text(
           fill ? "**** **** **** ${method!.substring(14, 19)}" : method!,
            style: TextStyle(fontSize: 20),
          ),

          const Spacer(),

          // radio checks.
          Container(
            height: 20,
            width: 20,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(style: BorderStyle.solid),
            ),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: fill ? Colors.black : Colors.transparent,
                shape: BoxShape.circle 
              ),
            ),
          ),
        ],
      ),
    );
  }
}