import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_nav_notifier.g.dart';

@riverpod
class ApplicationNavIndex extends _$ApplicationNavIndex {
  @override
  int build() {
    return 0;
  }

  // change index
  void changeIndex(int val) {
    state = val;
    print(state);
  }
}

// flutter pub run build_runner watch --delete-conflicting-outputs
