// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Object encapsulating WINDOWS device information.
class WindowsDeviceInfo {
  /// Constructs a [WindowsDeviceInfo].
  WindowsDeviceInfo({
    this.nbrOfCores,
  });

  /// Name given to the local machine.
  final int nbrOfCores;
}