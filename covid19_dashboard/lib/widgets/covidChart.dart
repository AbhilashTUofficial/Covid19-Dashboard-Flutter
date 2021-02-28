import 'package:covid19_dashboard/config/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidChart extends StatelessWidget {
  final List<double> cases;

  const CovidChart({@required this.cases});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Daily New Cases",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 16.0,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                        margin: 10.0,
                        showTitles: true,
                        rotateAngle: 35.0,
                        textStyle: Styles.chartLabelsTextStyle,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return "Jan 24";
                            case 1:
                              return "Jan 25";
                            case 2:
                              return "Jan 26";
                            case 3:
                              return "Jan 27";
                            case 4:
                              return "Jan 28";
                            case 5:
                              return "Jan 29";
                            case 6:
                              return "Jan 30";
                            default:
                              return " ";
                          }
                        }),
                    leftTitles: SideTitles(
                        margin: 10.0,
                        showTitles: true,
                        textStyle: Styles.chartLabelsTextStyle,
                        getTitles: (value) {
                          if (value == 0) {
                            return '0';
                          } else if (value % 3 == 0) {
                            return '${value ~/ 3 * 5}K';
                          }
                          return "";
                        }),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 3 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.black12,
                      dashArray: [5],
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: cases
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          BarChartGroupData(x: key, barRods: [
                            BarChartRodData(
                              y: value,
                              color: Colors.red,
                            )
                          ]),
                        ),
                      )
                      .values
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}
