import 'package:flutter/widgets.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static double? normalfontSize;
  static double? smallfontSize;
  static double? extraSmallfontSize;

  static double? extraExtraSmallFontSize;

  static double? historyFontSize;

  static double? mediumfontSize;
  static double? bigfontSize;
  static double?extrabigfontSize;
  static double? headerfontSize;
  static double? cardNamefontSize;
  static double? cardItemfontSize;
  static double? tabfontSize;

  static double? iconSize;
  static double? iconSizeDetail;
  static double? iconSizeMedium;
  static double? iconSizeRoom;
  static double? iconSizebig;
  static double? iconSizeExtrabig;
  static double? iconSizeSuccess;
  static double? iconSizeSmall;
  static double? iconSizeExtraSmall;
  static double? iconSizeHistory;
  static double? iconSizeLogo;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    var l = screenWidth;
    var f = screenHeight;
    if (l != null && f != null) {
      blockSizeHorizontal = l / 100;
      blockSizeVertical = f / 100;
    }

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;

    normalfontSize = blockSizeHorizontal! * 4.4;
    smallfontSize = blockSizeHorizontal! * 3.8;
    extraSmallfontSize = blockSizeHorizontal! * 3.3;
    extraExtraSmallFontSize = blockSizeHorizontal! * 3;
    mediumfontSize = blockSizeHorizontal! * 6;
    bigfontSize = blockSizeHorizontal! * 8;
    headerfontSize = blockSizeHorizontal! * 11;
    extrabigfontSize = blockSizeHorizontal! * 10;
    cardNamefontSize = blockSizeHorizontal! * 7;
    cardNamefontSize = blockSizeHorizontal! * 5.5;

    iconSize = blockSizeHorizontal! * 6;
    iconSizebig = blockSizeHorizontal! * 14;
    iconSizeRoom = blockSizeHorizontal! * 9.5;
  }
}
