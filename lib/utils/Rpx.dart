// 代码来源：https://www.jianshu.com/p/1eeea55f5c8d
import 'dart:ui';

class DhtRpx {
  // 分辨率的宽度
  static double physicalWith;
  // 分辨率的宽度
  static double physicalHeight;

  // 获取 dpr 倍率 @1x @2x @3x
  static double dpr;

  // 屏幕的宽度和高度
  static double screenWidth;
  static double screenHeight;

  // 状态栏的高度
  // 顶部状态栏的高度，有刘海的44，没有刘海的20
  static double topStatusHeight;
  // 导航栏的高度
  static double navigationBarHeight;
  // 底部的高度，有刘海的34，没有刘海的0
  static double bottomHeight;
  // 底部tabbar的高度
  static double bottomTabBarHeight;

  // rpx 和 px
  static double rpx;
  static double px;

  // 判断是手机是不是 iphoneX
  static bool isIphoneX;

  // 模仿小程序以 6s 宽度的 750 分辨率为适配基点，分成750份
  static void initialze({double standarSize = 750}) {

    // 1.手机物理分辨率
    physicalWith = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取 dpr 倍率 @1x @2x @3x
    dpr = window.devicePixelRatio;

    // 3.屏幕的宽度和高度
    screenWidth = physicalWith / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏的高度
    topStatusHeight = window.padding.top / dpr;
    navigationBarHeight = topStatusHeight + 44;
    bottomHeight = window.padding.bottom / dpr;
    bottomTabBarHeight = bottomHeight + 49;

    // 5.rpx 和 px
    rpx = screenWidth / standarSize;
    px = screenWidth / standarSize * 2; // px是rpx的两倍

    // 6.判断是不是iphoneX
    isIphoneX = topStatusHeight > 20 ? true : false;

  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

// 对double类型进行扩展
extension DoubleFit on double {
  double get px {
    return DhtRpx.setPx(this);
  }
  double get rpx {
    return DhtRpx.setRpx(this);
  }
}
// 对int类型进行扩展
extension IntFit on int {
  double get px {
    return DhtRpx.setPx(this.toDouble());
  }
  double get rpx {
    return DhtRpx.setRpx(this.toDouble());
  }
}