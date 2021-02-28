import 'package:covid19_dashboard/config/palette.dart';
import 'package:covid19_dashboard/widgets/countryDropdown.dart';
import 'package:covid19_dashboard/widgets/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'USA';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Palette.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "COVID-19",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                CountryDropdown(
                  countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                  country: _country,
                  onChanged: (val) => setState(() => _country = val),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you feeling sick?',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you '
                  'feel sick with any COVID-19 symptoms, please call or text '
                  'us for help',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    FlatButton.icon(
                      label: Text(
                        'Call Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.phone, color: Colors.white),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    SizedBox(width: 10),
                    FlatButton.icon(
                      label: Text(
                        'SMS',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prevention Tips',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Image.asset(
                    'assets/images/mask.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: 12),
                  Text('Wear a mask')
                ]),
                Column(children: [
                  Image.asset(
                    'assets/images/distance.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: 12),
                  Text('Keep your distance')
                ]),
                Column(children: [
                  Image.asset(
                    'assets/images/wash_hands.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: 12),
                  Text('Wash your hands')
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffad9fe4), Palette.primaryColor]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/own_test.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do your own test',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Follow the instructions\nto do your own test',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
