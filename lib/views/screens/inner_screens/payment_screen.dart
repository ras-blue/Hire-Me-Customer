import 'package:flutter/material.dart';
import 'package:hire_me_customer/views/screens/inner_screens/checkout_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPayOnDelivery = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment options',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'select payment method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pay on delivery',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Switch(
                  value: isPayOnDelivery,
                  onChanged: (value) {
                    setState(() {
                      isPayOnDelivery = value;
                    });
                    if (isPayOnDelivery) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CheckoutScreen();
                      }));
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
