// utils/device_utils.dart
import 'package:flutter/material.dart';

class DeviceUtils {

  // 使用 MediaQuery 获取物理像素信息，不依赖 flutter_screenutil
  static DeviceType getDeviceType(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    final double aspectRatio = screenWidth / screenHeight;
    final double devicePixelRatio = mediaQuery.devicePixelRatio;

    // 使用逻辑像素进行判断，不依赖设计稿
    if (_isDesktop(screenWidth, aspectRatio)) {
      return DeviceType.desktop;
    } else if (screenWidth > 1000) { // 调整阈值，使用逻辑像素
      return DeviceType.trifold;
    } else if (screenWidth > 600) {
      return aspectRatio < 1.4 ? DeviceType.foldableLarge : DeviceType.tablet;
    } else {
      return DeviceType.phone;
    }
  }

  static bool _isDesktop(double screenWidth, double aspectRatio) {
    return screenWidth > 1200 && aspectRatio > 1.6;
  }

  static bool isWideScreen(BuildContext context) {
    return getDeviceType(context) != DeviceType.phone;
  }

  static bool isDesktop(BuildContext context) {
    return getDeviceType(context) == DeviceType.desktop;
  }

// 移除所有依赖 flutter_screenutil 的方法
// 这些方法应该在具体的 Widget 中使用，而不是在工具类中
}

enum DeviceType {
  phone,
  tablet,
  foldableLarge,
  trifold,
  desktop,
}