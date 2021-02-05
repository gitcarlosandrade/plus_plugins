/// The Windows implementation of `package_info_plus`.
library package_info_plus_windows;

import 'dart:ffi';

import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

/// The Windows implementation of [PackageInfoPlatform].
class DeviceInfoWindows extends DeviceInfoPlatform {
  /// Returns a map with the following keys:
  /// appName, packageName, version, buildNumber
  @override
  Future<WindowsDeviceInfo> windowsInfo() {
    //final info = _FileVersionInfo(Platform.resolvedExecutable);
    final system_info = _getInfoStructPointer();
    
    GetSystemInfo(system_info);

    final data = WindowsDeviceInfo(
      nbrOfCores: system_info.ref.dwNumberOfProcessors,
    );
    free(system_info);
    return Future.value(data);
  }
}

Pointer<SYSTEM_INFO> _getInfoStructPointer() {
  final pointer = allocate<SYSTEM_INFO>();
  pointer.ref
    ..wProcessorArchitecture = 0
    ..wReserved = 0
    ..dwPageSize = 0
    ..lpMaximumApplicationAddress = nullptr
    ..lpMaximumApplicationAddress = nullptr
    ..dwActiveProcessorMask = 0
    ..dwNumberOfProcessors = 0
    ..dwProcessorType = 0
    ..dwAllocationGranularity = 0
    ..wProcessorLevel = 0
    ..wProcessorRevision = 0;
    return pointer;
}