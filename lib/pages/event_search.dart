import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internetfolks_assignment/providers/eventProvider.dart';
import 'package:internetfolks_assignment/utils/constants.dart';
import 'package:internetfolks_assignment/widgets/event_card.dart';
import 'package:provider/provider.dart';

class EventSearch extends StatefulWidget {
  const EventSearch({super.key});

  @override
  State<EventSearch> createState() => _EventSearchState();
}

class _EventSearchState extends State<EventSearch> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final events = eventProvider.events;
    final searchResults = eventProvider.searchResults;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: GoogleFonts.inter(
              fontSize: 30, fontWeight: FontWeight.w600, color: secondary),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 28.0, horizontal: 18.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/search.svg',
                  color: primary,
                  height: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 30,
                  width: 2,
                  color: primary,
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                    child: Container(
                  child: TextField(
                    controller: search,
                    style: GoogleFonts.inter(fontSize: 18, color: secondary),
                    onChanged: (value) => eventProvider.searchEvents(value),
                    decoration: InputDecoration(
                      hintText: 'Type Event Name',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 18, color: secondary.withOpacity(0.5)),
                      border: InputBorder.none,
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: searchResults.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final event = searchResults[index];
                      return EventCard(eventDetails: event);
                    })
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return EventCard(eventDetails: event);
                    }),
          )
        ],
      ),
    );
  }
}
