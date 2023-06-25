import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internetfolks_assignment/models/event.dart';
import 'package:internetfolks_assignment/utils/constants.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatefulWidget {
  final Event eventDetails;
  const EventScreen({super.key, required this.eventDetails});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime inputDateTime = DateTime.parse(widget.eventDetails.dateTime);
    DateTime convertedDateTime = inputDateTime.toLocal();
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              snap: true,
              title: Text(
                'Event Details',
                style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.4)),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            'assets/bookmark.svg',
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken),
                    child: Image.network(
                      widget.eventDetails.bannerImage,
                      fit: BoxFit.cover,
                    ),
                  ))
                ],
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.eventDetails.title,
                style: GoogleFonts.inter(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: secondary),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: getWidth(context),
                height: getHeight(context) * 0.07,
                child: Row(
                  children: [
                    Container(
                        height: getHeight(context) * 0.06,
                        width: getHeight(context) * 0.06,
                        child: Image.network(
                          widget.eventDetails.organiserIcon,
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.eventDetails.organiserName,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: secondary,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Organizers',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: secondary.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: getWidth(context),
                height: getHeight(context) * 0.07,
                child: Row(
                  children: [
                    Container(
                        height: getHeight(context) * 0.06,
                        width: getHeight(context) * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primary.withOpacity(0.2)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/calendar.svg',
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("dd MMMM, yyyy").format(convertedDateTime),
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: secondary,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${DateFormat("EEEE, h:mma").format(convertedDateTime)} - ${DateFormat("h:mma").format(convertedDateTime.add(const Duration(hours: 5)))}',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: secondary.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getWidth(context),
                height: getHeight(context) * 0.07,
                child: Row(
                  children: [
                    Container(
                        height: getHeight(context) * 0.06,
                        width: getHeight(context) * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primary.withOpacity(0.2)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/gps.svg',
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.eventDetails.venueName,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: secondary,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${widget.eventDetails.venueCity}, ${widget.eventDetails.venueCountry}',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: secondary.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'About event',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: secondary),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.eventDetails.description,
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: secondary),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          width: getWidth(context) * 0.5,
          height: getHeight(context) * 0.1,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: getWidth(context) * 0.6,
                decoration: BoxDecoration(
                    color: const Color(0xFF5669FF),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 18),
                  child: Text(
                    'BOOK NOW',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        letterSpacing: 1,
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
