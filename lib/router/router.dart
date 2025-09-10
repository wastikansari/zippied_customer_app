import 'package:go_router/go_router.dart';
import 'package:zippied_app/models/otp_model.dart';
import 'package:zippied_app/screen/account/profile_screen.dart';
import 'package:zippied_app/screen/address/address_create_edite_screen.dart';
import 'package:zippied_app/screen/address/address_screen.dart';
import 'package:zippied_app/screen/auth/details_screen.dart';
import 'package:zippied_app/screen/auth/otp_screen.dart';
import 'package:zippied_app/screen/auth/phone_screen.dart';
import 'package:zippied_app/screen/splash_screen.dart';
import 'package:zippied_app/services/bottom_navigation.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/phone',
      builder: (context, state) => const PhoneScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) {
        final otpResponse = state.extra as OtpResponse;
        return OtpScreen(otpResponse: otpResponse);
      },
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final otpResponse = state.extra as OtpResponse;
        return DetailsScreen(otpResponse: otpResponse);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomNavigation(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: '/address/create',
      builder: (context, state) => const AddressCreateEditScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
