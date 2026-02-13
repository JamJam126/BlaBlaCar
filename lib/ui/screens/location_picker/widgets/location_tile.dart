import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  final Location location;

  const LocationTile({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(location.name),
          subtitle: Text(location.country.name),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: BlaColors.greyLight,
          ),
          onTap: () {
            Navigator.pop<Location>(context, location);
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BlaDivider()
        ),
      ],
    ));
  }
}
