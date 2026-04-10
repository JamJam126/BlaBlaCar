import 'package:blabla/model/ride/locations.dart';

abstract class LocationsRepository {
  List<Location> getAvailableLocations();
}
