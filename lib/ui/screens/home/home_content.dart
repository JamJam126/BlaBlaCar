import 'package:blabla/ui/screens/home/home_screen.dart';
import 'package:blabla/ui/screens/home/home_view_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBackground(), _buildForeground(context)]);
  }

  Widget _buildForeground(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlaRidePreferencePicker(
                initRidePreference: viewModel.selectedPreference,
                onRidePreferenceSelected: (pref) =>
                    viewModel.onRidePrefSelected(context, pref),
              ),
              SizedBox(height: BlaSpacings.m),
              _buildHistory(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: viewModel.history.length,
        itemBuilder: (ctx, index) {
          final pref = viewModel.history[index];
          return HomeHistoryTile(
            ridePref: pref,
            onPressed: () => viewModel.onRidePrefSelected(context, pref),
          );
        },
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(blablaHomeImagePath, fit: BoxFit.cover),
    );
  }
}
