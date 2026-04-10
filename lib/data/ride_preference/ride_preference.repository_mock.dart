import 'package:blabla/data/ride_preference/ride_preference.repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePrefsRepositoryMock implements RidePrefsRepository {
  final List<RidePreference> _history = [];

  @override
  List<RidePreference> getPreferenceHistory() {
    return _history;
  }

  @override
  void addPreference(RidePreference preference) {
    _history.add(preference);
  }
}
