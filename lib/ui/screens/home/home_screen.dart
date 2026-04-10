import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/home/home_content.dart';
import 'package:blabla/ui/screens/home/home_view_model.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/animations_util.dart';
import '../../theme/theme.dart';
import '../../widgets/pickers/bla_ride_preference_picker.dart';
import '../rides_selection/rides_selection_screen.dart';
import 'widgets/home_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HomeViewModel(ridePrefState: context.read<RidePreferenceState>()),
      child: Builder(
        builder: (context) {
          final viewModel = context.watch<HomeViewModel>();
          return HomeContent(viewModel: viewModel);
        },
      ),
    );
  }
}
