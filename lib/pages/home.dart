import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internetfolks_assignment/pages/event_search.dart';
import 'package:internetfolks_assignment/providers/eventProvider.dart';
import 'package:internetfolks_assignment/utils/constants.dart';
import 'package:internetfolks_assignment/widgets/event_card.dart';
import 'package:internetfolks_assignment/widgets/loader.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final events = eventProvider.events;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Events',
            style: GoogleFonts.inter(
                fontSize: 30, fontWeight: FontWeight.w600, color: secondary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut,
                          type: PageTransitionType.rightToLeft,
                          child: EventSearch())),
                  child: SvgPicture.asset('assets/search.svg')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset('assets/more.svg'),
            )
          ],
        ),
        body: eventProvider.loading
            ? Loader(color: primary)
            : eventProvider.loading
                ? Center(child: Loader(color: primary))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return EventCard(eventDetails: event);
                    }));
  }
}
