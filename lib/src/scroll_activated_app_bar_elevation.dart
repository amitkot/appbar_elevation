import 'package:flutter/widgets.dart';

/// A builder that provides access to the BuildContext and the current value to
/// be used as AppBar elevation.
typedef BuilderWithElevation = Widget Function(
    BuildContext context, double appBarElevation);

/// Listens to scroll updates and calculates the AppBar elevation value.
/// The elevation is determined by the scroll position and the provided
/// [elevationInitial] and [elevationScrolled] values.
class ScrollActivatedAppBarElevation extends StatefulWidget {
  const ScrollActivatedAppBarElevation({
    required this.builder,
    this.elevationInitial = 0,
    this.elevationScrolled = 4,
    Key? key,
  }) : super(key: key);

  /// Initial elevation used when not scrolled. Defaults to 0.
  final double elevationInitial;

  /// Initial elevation used when not scrolled. Defaults to 4.
  final double elevationScrolled;

  /// Builder that provides the AppBar elevation level.
  final BuilderWithElevation builder;

  @override
  _ScrollActivatedAppBarElevationState createState() =>
      _ScrollActivatedAppBarElevationState();
}

class _ScrollActivatedAppBarElevationState
    extends State<ScrollActivatedAppBarElevation> {
  late double _appBarElevation;

  @override
  void initState() {
    super.initState();
    _appBarElevation = widget.elevationInitial;
  }

  @override
  Widget build(BuildContext context) => NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            final scrolledPixels = notification.metrics.extentBefore;
            final newElevation = scrolledPixels > 1
                ? widget.elevationScrolled
                : widget.elevationInitial;
            if (_appBarElevation != newElevation) {
              setState(() {
                _appBarElevation = newElevation;
              });
            }
          }
          return false;
        },
        child: widget.builder(context, _appBarElevation),
      );
}
