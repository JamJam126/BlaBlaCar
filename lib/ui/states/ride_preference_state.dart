import 'package:blabla/data/ride_preference/ride_preference.repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePrefsRepository repository;

  RidePreferenceState({required this.repository});

  RidePreference? _selectedPreference;

  final int maxAllowedSeats = 8;

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get history => repository.getPreferenceHistory();

  void selectPreference(RidePreference preference) {
    if (_selectedPreference != preference) {
      _selectedPreference = preference;

      repository.addPreference(preference);

      notifyListeners();
    }
  }
}
