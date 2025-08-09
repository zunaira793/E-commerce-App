// import 'package:get/get.dart';
//
//
// class FetchHomeScreenController extends GetxController {
//   final HomeRepository _homeRepository = HomeRepository();
//
//   /// States
//   var isLoading = false.obs;
//   var sections = <HomeScreenSection>[].obs;
//   var error = Rxn<dynamic>();
//
//   /// Fetch data method (same logic as Cubit)
//   Future<void> fetch({
//     String? country,
//     String? state,
//     String? city,
//     int? areaId,
//     int? radius,
//     double? latitude,
//     double? longitude,
//   }) async {
//     try {
//       isLoading.value = true;
//       error.value = null;
//
//       List<HomeScreenSection> homeScreenDataList =
//       await _homeRepository.fetchHome(
//         city: city,
//         areaId: areaId,
//         country: country,
//         state: state,
//         radius: radius,
//         latitude: latitude,
//         longitude: longitude,
//       );
//
//       sections.assignAll(homeScreenDataList);
//     } catch (e) {
//       error.value = e;
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
