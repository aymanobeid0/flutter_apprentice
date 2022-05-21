import 'package:deep_links/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';

class AppLink {
  static const String KHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';
  String? location;
  int? currentTab;
  String? itemId;
  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

  // TODO: Add fromLocation
  // convert Url string to AppLink
  //treat as an api ..path, query parameters
  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    // parsing uri
    final uri = Uri.parse(location);
    // get query parameters
    final params = uri.queryParameters;
    // getting index form qparams by passing the key for the map
    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final itemId = params[AppLink.kIdParam];
    final link =
        AppLink(location: uri.path, currentTab: currentTab, itemId: itemId);
    return link;
  }

  // TODO: Add toLocation
  // Converting an AppLink to a URL string
  String toLocation() {
    String addKeyValPair({required String key, String? value}) =>
        value == null ? '' : '$key=$value&';

// test the location and return it
    switch (location) {
      case kLoginPath:
        return kLoginPath;

      case kOnboardingPath:
        return kOnboardingPath;

      case kProfilePath:
        return kProfilePath;

      // when it is item path append ?id=${id}.
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyValPair(
          key: kIdParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);

      default:
        var loc = '$KHomePath?';
        loc += addKeyValPair(
          key: kTabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}
