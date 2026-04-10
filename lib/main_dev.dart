

import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/ride_preference/ride_preference.repository.dart';
import 'package:blabla/data/ride_preference/ride_preference.repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';

List<InheritedProvider> get devProviders {
  return [

    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePrefsRepository>(create: (_) => RidePrefsRepositoryMock()),

    ChangeNotifierProvider<RidePreferenceState>(create: (context) => 
      RidePreferenceState(repository: context.read<RidePrefsRepository>())
    )
  ];
}

void main() {
  mainCommon(devProviders);
}
