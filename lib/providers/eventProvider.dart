import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:internetfolks_assignment/models/event.dart';
import 'package:http/http.dart' as http;
import 'package:internetfolks_assignment/widgets/toast.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  List<Event> _searchResults = [];
  bool error = false;
  bool loading = true;

  List<Event> get events => _events;
  List<Event> get searchResults => _searchResults;

  EventProvider() {
    getEvents();
  }

  Future<void> getEvents() async {
    loading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final eventsList = data['content']['data'] as List<dynamic>;
        _events = eventsList
            .map((item) => Event(
                item['id'],
                item['title'],
                item['description'],
                item['banner_image'],
                item['date_time'],
                item['organiser_name'],
                item['organiser_icon'],
                item['venue_name'],
                item['venue_city'],
                item['venue_country']))
            .toList();
        notifyListeners();
        print(events);
      } else {
        error = true;
        showToast('Error loading data');
      }
    } catch (e) {
      print(e);
      showToast('Error loading data');
      error = true;
    }
    loading = false;
    notifyListeners();
  }

  void searchEvents(String query) {
    loading = true;
    notifyListeners();
    _searchResults.clear();

    if (query.isEmpty) {
      loading = false;
      notifyListeners();
      return;
    }

    _searchResults = _events
        .where((event) =>
            event.title.toLowerCase().contains(query.toLowerCase()) ||
            event.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    loading = false;
    notifyListeners();
  }
}
