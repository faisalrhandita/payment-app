import 'package:flutter/material.dart';
import 'package:payment_app/theme.dart';

void main() {
  runApp(PaymentsApps());
}

class PaymentsApps extends StatefulWidget {
  @override
  State<PaymentsApps> createState() => _PaymentsAppsState();
}

class _PaymentsAppsState extends State<PaymentsApps> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 32.0, right: 32.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/1.png',
                width: 267,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 80.0),
              child: Row(
                children: [
                  Text(
                    'Upgrade To',
                    style: titleText,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'PRO',
                    style: proText,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    'Go unlock all features and \n build your own business bigger',
                    style: subsText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget option(int index, String title, String subTitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xffFFFFFF),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Icon(
                          Icons.add_circle,
                          color: lightBlueColor,
                        )
                      : Icon(
                          Icons.add_circle_outline,
                          color: whiteColor,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planText,
                      ),
                      SizedBox(height: 2),
                      Text(
                        subTitle,
                        style: descText,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    price,
                    style: priceText,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: lightBlueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(71))),
                onPressed: () {},
                child: Text(
                  'Chekout Now',
                  style: buttonText,
                )),
          )
        ],
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: darkBlueColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  header(),
                  option(0, 'Monthly', 'Good for starting up', '\$20'),
                  option(1, 'Quarterly', 'Focusing on building', '\$55'),
                  option(2, 'Yearly', 'Steady company', '\$220'),
                  selectedIndex == -1 ? SizedBox() : SizedBox(height: 20,),
                  selectedIndex == -1 ? SizedBox() : checkoutButton(),
                  selectedIndex == -1 ? SizedBox() : SizedBox(height: 20,),
                ],
              ),
            )));
  }
}
