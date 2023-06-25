import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internetfolks_assignment/models/event.dart';
import 'package:internetfolks_assignment/pages/event_screen.dart';
import 'package:internetfolks_assignment/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class EventCard extends StatefulWidget {
  final Event eventDetails;
  const EventCard({super.key, required this.eventDetails});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            PageTransition(
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                type: PageTransitionType.rightToLeft,
                child: EventScreen(
                  eventDetails: widget.eventDetails,
                ))),
        child: Container(
          width: getWidth(context),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                offset: const Offset(0, 20),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                    height: getHeight(context) * 0.14,
                    width: getWidth(context) * 0.26,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.network(
                        widget.eventDetails.bannerImage,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: SizedBox(
                    height: getHeight(context) * 0.14,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDateTime(widget.eventDetails.dateTime),
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                color: primary,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.eventDetails.title,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: 24,
                                color: secondary,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/location.svg'),
                              const Text('  '),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    '${widget.eventDetails.venueName} • ${widget.eventDetails.venueCity}',
                                    softWrap: true,
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        color: secondary.withOpacity(0.4),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
