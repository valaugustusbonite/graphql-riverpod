import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:myapp/modules/home/screens/home.dart';
import 'package:myapp/modules/profile/screens/details_page.dart';
import 'package:myapp/modules/profile/screens/profile.dart';
import 'package:myapp/modules/todo/screens/todo.dart';

class RouteLocationGenerator {
  static const String homeRoute = '/';
  static const String profileRoute = '/profile';
  static const String todoRoute = '/todo';
}

//OPTION A: SIMPLE LOCATION BUILDER

class SimpleLocationGenerator {
  static final simpleLocationBuilder = SimpleLocationBuilder(
    routes: {
      '/' : (context, state) => BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: HomePage(),
        type: BeamPageType.noTransition,
      ),
      '/profile' : (context, state) => BeamPage(
        key: ValueKey('profile'),
        title: 'Profile',
        child: ProfilePage(),
        type: BeamPageType.noTransition,
      ),
      '/todo' : (context, state) => BeamPage(
        key: ValueKey('todo'),
        title: 'Todo',
        child: TodoPage(),
        type: BeamPageType.noTransition,
      ),
      '/profile/:username': (context, BeamState state) => BeamPage(
        key: ValueKey('aboutme-${state.pathParameters['username']}'),
        title: '${state.data['name']}',
        popToNamed: '/profile',
        child: DetailsPage(
          id: state.pathParameters['username'],
          test: context.currentBeamLocation.state.pathParameters['test'],
        ),
      )
    }
  );

}

//OPTION B: BEAM LOCATION BUILDER

// List<BeamLocation> beamLocations = [
//     HomeLocation(),
//     AboutLocation(),
//     SettingsLocation(),
//   ];

// class BeamLocationGenerator {
//   static final beamerLocationBuilder = BeamerLocationBuilder(
//     beamLocations: beamLocations,
//   );
   
// }

// class HomeLocation extends BeamLocation {
//   HomeLocation({BeamState? state}) : super(state);

//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) {
//     return [
//       BeamPage(
//         key: ValueKey('home'),
//         title: 'Home',
//         child: HomePage(),
//         type: BeamPageType.noTransition,
//       )
//     ];
//   }

//   @override
//   List get pathBlueprints => ['/*'];

// } 

// class AboutLocation extends BeamLocation {
//   AboutLocation({BeamState? state}) : super(state);

//   @override
//   List<String> get pathBlueprints => ['/aboutme/*'];

//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) => [
//         ...HomeLocation(state: state).buildPages(context, state),
//         if (state.uri.pathSegments.contains('aboutme'))
//           BeamPage(
//             key: ValueKey('aboutme'),
//             title: 'About',
//             child: AboutPage(),
//             //type: BeamPageType.noTransition,
//           ),
//         if (state.uri.pathSegments.contains('foodId'))
//           BeamPage(
//             key: ValueKey('aboutme-${state.pathParameters["id"]}'),
//             child: FoodDetail(),
//           )
//       ];
// }

// class SettingsLocation extends BeamLocation {
//   SettingsLocation({BeamState? state}) : super(state);

//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) {
//     return [
//       ...HomeLocation(state: state).buildPages(context, state),
//       if (state.uri.pathSegments.contains('settings'))
//         BeamPage(
//           key: ValueKey('settings'),
//           title: 'Settings',
//           child: SettingsPage()
//         )
//     ];
//   }

//   @override
//   // TODO: implement pathBlueprints
//   List get pathBlueprints => ['/settings/:settingsItem'];

// }
