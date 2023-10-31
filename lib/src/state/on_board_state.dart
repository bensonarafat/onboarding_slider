import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_slider_flutter/src/models/onboard_state_model.dart';

class OnBoardStateNotifier extends StateNotifier<OnBoardState> {
  OnBoardStateNotifier() : super(const OnBoardState());

  void onPageChanged(int page, int dataLength) {
    final isLastPage = page == dataLength - 1;
    state = state.copyWith(page: page, isLastPage: isLastPage);
  }
}
