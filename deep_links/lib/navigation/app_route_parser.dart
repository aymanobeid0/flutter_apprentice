import 'package:flutter/material.dart';
import 'app_link.dart';

class AppRouteParser extends RouteInformationParser<AppLink> {
  // from url to navigation state
  // navigation state ==path and query params
  @override
  Future<AppLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = AppLink.fromLocation(routeInformation.location);
    return link;
  }

// from navigation state to url string
  @override
  RouteInformation restoreRouteInformation(AppLink appLink) {
    final location = appLink.toLocation();
    return RouteInformation(location: location);
  }
}
