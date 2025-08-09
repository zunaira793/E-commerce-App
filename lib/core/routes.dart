
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/hive_utils.dart';

class Routes {
  static const splash = 'splash';
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const forgotPassword = 'forgotPassword';
  static const signup = 'signup';
  static const signupMainScreen = 'signUpMainScreen';
  static const mobileSignUp = 'mobileSignUp';
  static const completeProfile = 'complete_profile';
  static const main = 'main';
  static const home = 'Home';
  static const addItem = 'addItem';
  static const waitingScreen = 'waitingScreen';
  static const categories = 'Categories';
  static const addresses = 'address';
  static const chooseAddress = 'chooseAddress';
  static const itemsList = 'itemsList';
  static const contactUs = 'ContactUs';
  static const profileSettings = 'profileSettings';
  static const filterScreen = 'filterScreen';
  static const notificationPage = 'notificationpage';
  static const notificationDetailPage = 'notificationdetailpage';
  static const addItemScreenRoute = 'addItemScreenRoute';
  static const blogsScreenRoute = 'blogsScreenRoute';
  static const subscriptionPackageListRoute = 'subscriptionPackageListRoute';
  static const subscriptionScreen = 'subscriptionScreen';
  static const maintenanceMode = '/maintenanceMode';
  static const favoritesScreen = '/favoritescreen';
  static const promotedItemsScreen = '/promotedItemsScreen';
  static const mostLikedItemsScreen = '/mostLikedItemsScreen';
  static const mostViewedItemsScreen = '/mostViewedItemsScreen';
  static const blogDetailsScreenRoute = '/blogDetailsScreenRoute';
  static const myReviewsScreen = '/myReviewsScreenRoute';

  static const languageListScreenRoute = '/languageListScreenRoute';
  static const searchScreenRoute = '/searchScreenRoute';
  static const itemMapScreen = '/ItemMap';
  static const dashboard = '/dashboard';
  static const subCategoryScreen = '/subCategoryScreen';
  static const categoryFilterScreen = '/categoryFilterScreen';
  static const subCategoryFilterScreen = '/subCategoryFilterScreen';
  static const postedSinceFilterScreen = '/postedSinceFilterScreen';
  static const locationPermissionScreen = '/locationPermissionScreen';
  static const sellerProfileScreen = '/sellerProfileScreen';
  static const nearbyLocationScreen = '/nearbyLocationScreen';

  static const myAdvertisment = '/myAdvertisment';
  static const transactionHistory = '/transactionHistory';
  static const personalizedItemScreen = '/personalizedItemScreen';
  static const myItemScreen = '/myItemScreen';
  static const pdfViewerScreen = '/pdfViewerScreen';
  static const countriesScreen = '/countriesScreen';
  static const statesScreen = '/statesScreen';
  static const citiesScreen = '/citiesScreen';
  static const areasScreen = '/areasScreen';
  static const faqsScreen = '/faqsScreen';
  static const soldOutBoughtScreen = '/soldOutBoughtScreen';
  static const sellerIntroVerificationScreen = '/sellerIntroVerificationScreen';
  static const sellerVerificationScreen = '/sellerVerificationScreen';
  static const sellerVerificationComplteScreen =
      '/sellerVerificationComplteScreen';

  static const selectItemTypeScreen = '/selectItemType';
  static const addItemDetailsScreen = '/addItemDetailsScreen';
  static const setItemParametersScreen = '/setItemParametersScreen';
  static const selectOutdoorFacility = '/selectOutdoorFacility';
  static const adDetailsScreen = '/adDetailsScreen';
  static const successItemScreen = '/successItemScreen';

  static const selectCategoryScreen = '/selectCategoryScreen';
  static const selectNestedCategoryScreen = '/selectNestedCategoryScreen';
  static const addItemDetails = '/addItemDetails';
  static const addMoreDetailsScreen = '/addMoreDetailsScreen';
  static const confirmLocationScreen = '/confirmLocationScreen';
  static const sectionWiseItemsScreen = '/sectionWiseItemsScreen';
  static const blockedUserListScreen = '/blockedUserListScreen';
  static const payStackWebViewScreen = '/payStackWebViewScreen';
  static const jobApplicationForm = '/jobApplicationForm';
  static const jobApplicationList = '/jobApplicationList';

  static const playground = 'playground';

  static String currentRoute = '';
  static String previousRoute = '';

  // static Route onGenerateRouted(RouteSettings routeSettings) {
  //   previousRoute = currentRoute;
  //
  //   currentRoute = routeSettings.name ?? "";
  //
  //   if (routeSettings.name!.contains('/product-details/') ||
  //       routeSettings.name!.contains('/seller/')) {
  //     final uri = Uri.parse(routeSettings.name!);
  //     final pathSegments = uri.pathSegments;
  //
  //     final type = pathSegments[0];
  //     final value = pathSegments[1];
  //
  //     HiveUtils.setUserSkip();
    //
    //   if (type == 'product-details') {
    //     if (previousRoute.isEmpty) {
    //       return MaterialPageRoute(
    //           builder: (_) => SplashScreen(itemSlug: value));
    //     } else {
    //       if (currentRoute == adDetailsScreen) {
    //         Constant.navigatorKey.currentState?.pop();
    //       }
    //       return AdDetailsScreen.route(
    //         RouteSettings(arguments: {"slug": value}),
    //       );
    //     }
    //   } else if (type == 'seller') {
    //     if (previousRoute.isEmpty) {
    //       return MaterialPageRoute(
    //           builder: (_) => SplashScreen(sellerId: value));
    //     } else {
    //       if (currentRoute == sellerProfileScreen) {
    //         Constant.navigatorKey.currentState?.pop();
    //       }
    //       return SellerProfileScreen.route(
    //         RouteSettings(arguments: {"sellerId": int.parse(value)}),
    //       );
    //     }
    //   }
    // }
    //
    // switch (routeSettings.name) {
    //   case splash:
    //     return MaterialPageRoute(builder: ((context) => const SplashScreen()));
    //   case onboarding:
    //     return CupertinoPageRoute(
    //         builder: ((context) => const OnboardingScreen()));
    //   case main:
    //     return MainActivity.route(routeSettings);
    //   case login:
    //     return LoginScreen.route(routeSettings);
    //   case forgotPassword:
    //     return ForgotPasswordScreen.route(routeSettings);
    //   case signup:
    //     return SignupScreen.route(routeSettings);
    //   case signupMainScreen:
    //     return SignUpMainScreen.route(routeSettings);
    //   case mobileSignUp:
    //     return MobileSignUpScreen.route(routeSettings);
    //   case completeProfile:
    //     return UserProfileScreen.route(routeSettings);
    //
    //   case categories:
    //     return CategoryList.route(routeSettings);
    //   case subCategoryScreen:
    //     return SubCategoryScreen.route(routeSettings);
    //   case categoryFilterScreen:
    //     return CategoryFilterScreen.route(routeSettings);
    //   case subCategoryFilterScreen:
    //     return SubCategoryFilterScreen.route(routeSettings);
    //   case postedSinceFilterScreen:
    //     return PostedSinceFilterScreen.route(routeSettings);
    //   case maintenanceMode:
    //     return MaintenanceMode.route(routeSettings);
    //   case languageListScreenRoute:
    //     return LanguagesListScreen.route(routeSettings);
    //   case contactUs:
    //     return ContactUs.route(routeSettings);
    //   case locationPermissionScreen:
    //     return LocationPermissionScreen.route(routeSettings);
    //   case profileSettings:
    //     return ProfileSettings.route(routeSettings);
    //   case filterScreen:
    //     return FilterScreen.route(routeSettings);
    //   case notificationPage:
    //     return Notifications.route(routeSettings);
    //   case notificationDetailPage:
    //     return NotificationDetail.route(routeSettings);
    //   case blogsScreenRoute:
    //     return BlogsScreen.route(routeSettings);
    //   case successItemScreen:
    //     return SuccessItemScreen.route(routeSettings);
    //   case jobApplicationForm:
    //     return JobApplicationForm.route(routeSettings);
    //   case jobApplicationList:
    //     return JobApplicationListScreen.route(routeSettings);
    //   case blogDetailsScreenRoute:
    //     return BlogDetails.route(routeSettings);
    //   case subscriptionPackageListRoute:
    //     return SubscriptionPackageListScreen.route(routeSettings);
    //
    //   case favoritesScreen:
    //     return FavoriteScreen.route(routeSettings);
    //
    //   case transactionHistory:
    //     return TransactionHistory.route(routeSettings);
    //   case blockedUserListScreen:
    //     return BlockedUserListScreen.route(routeSettings);
    //   case countriesScreen:
    //     return CountriesScreen.route(routeSettings);
    //
    //   case statesScreen:
    //     return StatesScreen.route(routeSettings);
    //   case citiesScreen:
    //     return CitiesScreen.route(routeSettings);
    //   case areasScreen:
    //     return AreasScreen.route(routeSettings);
    //
    //   case myAdvertisment:
    //     return MyAdvertisementScreen.route(routeSettings);
    //   case myItemScreen:
    //     return ItemsScreen.route(routeSettings);
    //   case searchScreenRoute:
    //     return SearchScreen.route(routeSettings);
    //
    //   case itemsList:
    //     return ItemsList.route(routeSettings);
    //   case faqsScreen:
    //     return FaqsScreen.route(routeSettings);
    //
    //   case selectCategoryScreen:
    //     return SelectCategoryScreen.route(routeSettings);
    //   case selectNestedCategoryScreen:
    //     return SelectNestedCategory.route(routeSettings);
    //   case addItemDetails:
    //     return AddItemDetails.route(routeSettings);
    //   case addMoreDetailsScreen:
    //     return AddMoreDetailsScreen.route(routeSettings);
    //
    //   case confirmLocationScreen:
    //     return ConfirmLocationScreen.route(routeSettings);
    //   case sectionWiseItemsScreen:
    //     return SectionItemsScreen.route(routeSettings);
    //
    //   case adDetailsScreen:
    //     return AdDetailsScreen.route(routeSettings);
    //
    //   case pdfViewerScreen:
    //     return PdfViewer.route(routeSettings);
    //   case soldOutBoughtScreen:
    //     return SoldOutBoughtScreen.route(routeSettings);
    //   case sellerProfileScreen:
    //     return SellerProfileScreen.route(routeSettings);
    //   case sellerIntroVerificationScreen:
    //     return SellerIntroVerificationScreen.route(routeSettings);
    //   case sellerVerificationScreen:
    //     return SellerVerificationScreen.route(routeSettings);
    //   case sellerVerificationComplteScreen:
    //     return SellerVerificationCompleteScreen.route(routeSettings);
    //   case nearbyLocationScreen:
    //     return NearbyLocationScreen.route(routeSettings);
    //   case myReviewsScreen:
    //     return MyReviewScreen.route(routeSettings);
    //
    //   default:
    //     return CupertinoPageRoute(builder: (context) => const Scaffold());
    // }
  }
// }
