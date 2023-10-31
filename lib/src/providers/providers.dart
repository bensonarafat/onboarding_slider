import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_slider/src/models/onboard_state_model.dart';
import 'package:onboarding_slider/src/state/on_board_state.dart';

final onBoardStateProvider =
    StateNotifierProvider<OnBoardStateNotifier, OnBoardState>(
  (ref) {
    final onBoardStateNotifier = OnBoardStateNotifier();
    return onBoardStateNotifier;
  },
);
