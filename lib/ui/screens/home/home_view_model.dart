import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePrefState;

  HomeViewModel({required this.ridePrefState}) {
    ridePrefState.addListener(_onStateChanged);
  }

  RidePreference? get selectedPreference => ridePrefState.selectedPreference;

  List<RidePreference> get history => ridePrefState.history.reversed.toList();

  void onRidePrefSelected(
    BuildContext context,
    RidePreference selectedPreference,
  ) async {
    ridePrefState.selectPreference(selectedPreference);

    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));

    notifyListeners(); 
  }

  void _onStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    ridePrefState.removeListener(_onStateChanged);
    super.dispose();
  }
}
