import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid19_dashboard/config/palette.dart';
import 'package:covid19_dashboard/config/style.dart';
import 'package:covid19_dashboard/data/data.dart';
import 'package:covid19_dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: CovidChart(
                cases: covidUSADailyNewsCases,
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(25)),
          child: TabBar(
            indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                indicatorHeight: 40.0),
            labelColor: Colors.black,
            labelStyle: Styles.tabTextStyle,
            tabs: [Text('My Country'), Text('Global')],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [Text('Total'), Text('Today'), Text('Yesterday')],
          ),
        ),
      ),
    );
  }
}
