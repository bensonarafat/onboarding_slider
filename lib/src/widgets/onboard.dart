import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_slider_flutter/src/constants/constants.dart';
import 'package:onboarding_slider_flutter/src/models/onboard_model.dart';
import 'package:onboarding_slider_flutter/src/models/page_indicator_style_model.dart';
import 'package:onboarding_slider_flutter/src/providers/providers.dart';
import 'package:onboarding_slider_flutter/src/widgets/page_indicator.dart';

class OnBoard extends HookConsumerWidget {
  /// Data for OnBoard [List<OnBoardModel>]
  /// @Required
  final List<OnBoardModel> onBoardData;

  /// start Button Widget
  /// required startButton
  final Widget startButton;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

  /// OnTapping done button action
  final VoidCallback? onDone;

  /// Controller for [PageView]
  /// @Required
  final PageController pageController;

  /// Title text style
  final TextStyle? titleStyles;

  /// Description text style
  final TextStyle? descriptionStyles;

  /// OnBoard Image width
  final double? imageWidth;

  /// OnBoard Image height
  final double? imageHeight;

  /// Skip Button Widget
  final Widget? skipButton;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  /// [showSkip] to show showskip button
  final bool showSkip;

  /// [decoration] to show decoration on the slider
  final BoxDecoration? decoration;

  const OnBoard({
    Key? key,
    required this.onBoardData,
    required this.startButton,
    this.onSkip,
    this.onDone,
    required this.pageController,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.showSkip = true,
    this.decoration,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: _OnBoard(
        onBoardData: onBoardData,
        pageController: pageController,
        onSkip: onSkip,
        showSkip: showSkip,
        onDone: onDone,
        titleStyles: titleStyles,
        descriptionStyles: descriptionStyles,
        imageWidth: imageWidth,
        imageHeight: imageHeight,
        skipButton: skipButton,
        startButton: startButton,
        duration: duration,
        curve: curve,
        pageIndicatorStyle: pageIndicatorStyle,
        decoration: decoration,
      ),
    );
  }
}

class _OnBoard extends HookConsumerWidget {
  /// Data for OnBoard [List<OnBoardModel>]
  /// @Required
  final List<OnBoardModel> onBoardData;

  /// start Button Widget
  /// required startButton
  final Widget startButton;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

  /// OnTapping done button action
  final VoidCallback? onDone;

  /// Controller for [PageView]
  /// @Required
  final PageController pageController;

  /// Title text style
  final TextStyle? titleStyles;

  /// Description text style
  final TextStyle? descriptionStyles;

  /// OnBoard Image width
  final double? imageWidth;

  /// OnBoard Image height
  final double? imageHeight;

  /// Skip Button Widget
  final Widget? skipButton;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  /// [showSkip] to show showskip button
  final bool showSkip;

  /// [decoration] to show decoration on the slider
  final BoxDecoration? decoration;

  const _OnBoard({
    Key? key,
    required this.onBoardData,
    required this.startButton,
    this.onSkip,
    this.onDone,
    this.showSkip = true,
    required this.pageController,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.decoration,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBoardState = ref.watch(onBoardStateProvider);
    final onBoardStateNotifier = ref.watch(onBoardStateProvider.notifier);

    final screenSize = MediaQuery.of(context).size;
    final double pageViewHeight = screenSize.height -
        skipContainerHeight -
        footerContentHeight -
        pageIndicatorHeight;

    return Container(
      decoration: decoration,
      child: SafeArea(
        child: Stack(
          children: [
            showSkip
                ? Container(
                    height: skipContainerHeight,
                    alignment: Alignment.centerRight,
                    child: skipButton ??
                        TextButton(
                          onPressed: () => _onSkipPressed(onSkip),
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                  )
                : Container(),
            SizedBox(
              height: pageViewHeight,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (page) => onBoardStateNotifier.onPageChanged(
                  page,
                  onBoardData.length,
                ),
                itemCount: onBoardData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          onBoardData[index].image,
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.contain,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            onBoardData[index].title,
                            textAlign: TextAlign.center,
                            style: titleStyles ??
                                const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            onBoardData[index].description,
                            textAlign: TextAlign.center,
                            style: descriptionStyles ??
                                const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: pageIndicatorHeight,
                    child: PageIndicator(
                      count: onBoardData.length,
                      activePage: onBoardState.page,
                      pageIndicatorStyle: pageIndicatorStyle,
                    ),
                  ),
                  Container(
                    height: footerContentHeight,
                    width: screenSize.width,
                    alignment: Alignment.center,
                    child: ButtonTheme(
                      minWidth: 230,
                      height: 50,
                      child: startButton,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipPressed(VoidCallback? onSkip) {
    if (onSkip == null) {
      throw Exception(
          'Either provide "onSkip" callback or add "skipButton" Widget to "OnBoard" Widget to handle skip state');
    } else {
      onSkip();
    }
  }
}
