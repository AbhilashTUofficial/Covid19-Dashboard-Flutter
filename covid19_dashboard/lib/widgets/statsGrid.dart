import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatsGrid(Colors.orange, 'Total', '1.8M'),
                _buildStatsGrid(Colors.red, 'Deaths', '30k'),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatsGrid(Colors.green, 'Recoveries', '3.1M'),
                _buildStatsGrid(Colors.purple, 'Active', '3k'),
                _buildStatsGrid(Colors.blue, 'Critical', '200'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildStatsGrid(MaterialColor color, String title, String count) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(count,
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),)
          ],
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
