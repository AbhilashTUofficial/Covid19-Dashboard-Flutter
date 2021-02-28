import 'package:covid19_dashboard/config/palette.dart';
import 'package:covid19_dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _selectedDay=DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        appBar: CustomAppBar(),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            _buildHeader(),
            _buildCalendar(),
          ],
        ));
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Calendar',
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SliverPadding _buildCalendar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Container(),
        ),
      ),
    );
  }
}
