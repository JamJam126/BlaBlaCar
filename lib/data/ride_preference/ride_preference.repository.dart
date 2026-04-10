import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePrefsRepository {
  List<RidePreference> getPreferenceHistory();

  void addPreference(RidePreference preference);
}
