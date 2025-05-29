import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_services/onboarding/onboarding.dart';
import 'package:pet_services/pages/adoption.dart';
import 'package:pet_services/pages/service.dart';
import 'package:pet_services/pages/grooming.dart';
import 'package:pet_services/pages/home.dart';
import 'package:pet_services/pages/veterinary.dart';
import 'package:pet_services/routes/routes_name.dart';

class RoutesConfig {
  static GoRouter returnRouter(){
    return GoRouter(
      initialLocation: '/onboarding',
      routes:  [
        GoRoute(path: '/onboarding',
        name: RoutesName.onboarding,
        pageBuilder: (context, state) => MaterialPage(child: OnboardingScreen()),
        ),
        GoRoute(path: '/home',
        name: RoutesName.home,
        pageBuilder:(context, state) => MaterialPage(child: HomePage()),
        ),
        GoRoute(path: '/adoption',
        name: RoutesName.adoption,
        pageBuilder:(context, state) => MaterialPage(child: PetAdoptionScreen()),
        ),
        GoRoute(path: '/grooming',
        name: RoutesName.grooming,
        pageBuilder:(context, state) => MaterialPage(child: GroomingScreen()),
        ),
         GoRoute(path: '/boarding',
        name: RoutesName.boarding,
        pageBuilder:(context, state) => MaterialPage(child: ServiceListingScreen()),
        ),

    ]);
    
  }
}