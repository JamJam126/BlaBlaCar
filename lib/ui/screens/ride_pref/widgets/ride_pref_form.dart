import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:blabla/ui/widgets/inputs/ride_pref_input_field.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void _handleSwap() {
    if (departure == null && arrival == null) return;

    setState(() {
      final Location temp = departure!;
      departure = arrival;
      arrival = temp;
    });
  }
  
  void _handleSearch() {

  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RideprefInputField(
            icon: Icons.location_on,
            label: departure?.name,
            placeholder: 'Leaving from',
            onTap: () => {},
            trailing: (departure != null || arrival != null)
              ? IconButton(
                  icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  onPressed: _handleSwap,
                )
              : null,
          ),
      
          RideprefInputField(
            icon: Icons.location_on,
            label: arrival?.name,
            placeholder: 'Going to',
            onTap: () {},
          ),
      
          RideprefInputField(
            icon: Icons.calendar_month,
            label:
                '${departureDate.day}/${departureDate.month}/${departureDate.year}',
            placeholder: '',
            onTap: () {},
          ),
      
          RideprefInputField(
            icon: Icons.person_outlined,
            label: '$requestedSeats passenger${requestedSeats > 1 ? 's' : ''}',
            placeholder: '',
            onTap: () {},
          ),
      
          BlaButton(
            text: 'Search', 
            variant: BlaButtonVariant.primary, 
            expand: true, radius: 0,
            onPressed: _handleSearch,
          ),
        ],
      ),
    );
  }
}
