import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/screens/location_picker/widgets/location_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  final  Location? selectedLocation;
  const LocationPickerScreen({super.key, required this.selectedLocation});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  String search = '';
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    search = widget.selectedLocation?.name ?? '';
    _searchController = TextEditingController(text: search);
  }

  @override
  Widget build(BuildContext context) {
    final filteredLocations = fakeLocations
        .where(
          (loc) =>
              loc.name.toLowerCase().contains(search.toLowerCase()) ||
              loc.country.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: BlaColors.greyLight,
                hintText: 'Station Road or The Bridge Cafe',
                hintStyle: TextStyle(
                  color: BlaColors.neutralLight,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop<Location>(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: BlaColors.neutralLight,
                    size: 20,
                  ),
                ),
                suffixIcon: search.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            search = '';
                            _searchController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.clear,
                          color: BlaColors.neutralLight,
                          size: 24,
                        ),
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
          ),

          if (search != '')
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = filteredLocations[index];
                  return LocationTile(location: location);
                },
              ),
            ),
        ],
      ),
    );
  }
}
