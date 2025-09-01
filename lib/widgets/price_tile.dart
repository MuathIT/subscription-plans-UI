import 'package:flutter/material.dart';

class PriceTile extends StatelessWidget {
  final String text; // tile text.
  final String price; // tile price.
  final bool total; // check for total tile.
  const PriceTile({
    super.key,
    required this.text,
    required this.price,
    this.total = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// text + price.

        // text.
        Text(text, style: TextStyle(color: Colors.black54, fontSize: total ? 20 : 18)),

        const Spacer(),

        // price.
        Text("\$$price", style: TextStyle(color: Colors.black, fontSize: total ? 20 : 18)),
      ],
    );
  }
}
