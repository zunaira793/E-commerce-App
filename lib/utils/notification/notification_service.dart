// ignore_for_file: file_names

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/routes.dart';
import '../../model/item/item_model.dart';
import '../constant.dart';
import '../helper_utils.dart';
import '../hive_utils.dart';
import 'awsome_notification.dart';

import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'chat_message_handler.dart';

String currentlyChatingWith = "";
String currentlyChatItemId = "";

@pragma('vm:entry-point')
class NotificationService {
  static FirebaseMessaging messagingInstance = FirebaseMessaging.instance;
  // static LocalAwesomeNotification localNotification = LocalAwesomeNotification();

  static late StreamSubscription<RemoteMessage> foregroundStream;
  static late StreamSubscription<RemoteMessage> onMessageOpen;

  static String? getPrice(dynamic price) {
    if (price == null || price
        .toString()
        .isEmpty) return null;
    if (price is String || price is int || price is double) {
      return price.toString();
    }
    return null;
  }

  static double? getOfferPrice(dynamic price) {
    if (price == null || price
        .toString()
        .isEmpty) return null;
    if (price is String) return double.tryParse(price);
    if (price is int) return price.toDouble();
    if (price is double) return price;
    return null;
  }

  // static void handleNotification(RemoteMessage? message, bool isTerminated) {
  //   var notificationType = message?.data['type'] ?? "";
  //
  //   // ✅ Items update
  //   if (notificationType == Constant.notificationTypeItemUpdate ||
  //       notificationType == Constant.notificationTypeItemEdit) {
  //     Get.find<FetchMyItemsController>().fetchMyItems(
  //         getItemsWithStatus: selectItemStatus);
  //   }
  //
  //   // ✅ Chat notifications
  //   if (notificationType == Constant.notificationTypeChat && !isTerminated) {
  //     var username = message?.data['user_name'];
  //     var itemImage = message?.data['item_image'];
  //     var itemName = message?.data['item_name'];
  //     var userProfile = message?.data['user_profile'];
  //     var senderId = message?.data['user_id'];
  //     var itemId = message?.data['item_id'];
  //     var date = message?.data['created_at'];
  //     var itemOfferId = message?.data['item_offer_id'];
  //     var itemPrice = message?.data['item_price'];
  //     var itemOfferPrice = message?.data['item_offer_amount'];
  //     var userType = message?.data['user_type'];
  //
  //     if (senderId == currentlyChatingWith && itemId == currentlyChatItemId) {
  //       // ✅ Directly adding message to chat if already open
  //       ChatMessageModal chatMessageModel = ChatMessageModal(
  //         id: int.parse(message?.data['id']),
  //         updatedAt: message?.data['updated_at'],
  //         createdAt: message?.data['created_at'],
  //         itemId: int.parse(message?.data['item_id']),
  //         audio: message?.data['audio'],
  //         file: message?.data['file'],
  //         message: message?.data['message'],
  //         receiverId: int.parse(HiveUtils.getUserId().toString()),
  //         senderId: int.parse(message?.data['sender_id']),
  //       );
  //
  //       ChatMessageHandler.add(
  //         ChatMessage(
  //           key: ValueKey(DateTime.now().toString()),
  //           message: chatMessageModel.message,
  //           senderId: chatMessageModel.senderId!,
  //           createdAt: chatMessageModel.createdAt!,
  //           isSentNow: false,
  //           updatedAt: chatMessageModel.updatedAt!,
  //           audio: chatMessageModel.audio,
  //           file: chatMessageModel.file,
  //           itemOfferId: chatMessageModel.id!,
  //         ),
  //       );
  //
  //       totalMessageCount++;
  //     } else {
  //       // ✅ Update relevant chat list
  //       if (userType == "Buyer") {
  //         Get.find<GetSellerChatListController>().addOrUpdateChat(
  //           ChatUser(
  //             itemId: itemId is String ? int.parse(itemId) : itemId,
  //             amount: getOfferPrice(itemOfferPrice),
  //             createdAt: date,
  //             userBlocked: false,
  //             id: int.parse(itemOfferId),
  //             updatedAt: date,
  //             item: Item(
  //               id: int.parse(itemId),
  //               price: itemPrice != null && getPrice(itemPrice) != null
  //                   ? double.tryParse(getPrice(itemPrice)!)
  //                   : null,
  //               name: itemName,
  //               image: itemImage,
  //             ),
  //             buyerId: int.parse(senderId),
  //             buyer: Buyer(name: username,
  //                 profile: userProfile,
  //                 id: int.parse(senderId)),
  //             unreadCount: 1,
  //           ),
  //         );
  //       } else {
  //         Get.find<GetBuyerChatListController>().addOrUpdateChat(
  //           ChatUser(
  //             itemId: itemId is String ? int.parse(itemId) : itemId,
  //             userBlocked: false,
  //             amount: getOfferPrice(itemOfferPrice),
  //             createdAt: date,
  //             id: int.parse(itemOfferId),
  //             sellerId: int.parse(senderId),
  //             updatedAt: date,
  //             item: Item(
  //               id: int.parse(itemId),
  //               price: itemPrice != null && getPrice(itemPrice) != null
  //                   ? double.tryParse(getPrice(itemPrice)!)
  //                   : null,
  //               name: itemName,
  //               image: itemImage,
  //             ),
  //             seller: Seller(name: username,
  //                 profile: userProfile,
  //                 id: int.parse(senderId)),
  //             unreadCount: 1,
  //           ),
  //         );
  //       }
  //
  //       // ✅ Show local notification
  //       localNotification.createNotification(
  //         isLocked: false,
  //         notificationData: message!,
  //       );
  //     }
  //   } else {
  //     // ✅ For all other notifications
  //     localNotification.createNotification(
  //       isLocked: false,
  //       notificationData: message!,
  //     );
  //   }
  // }
  //
  // static void init() {
  //   registerListeners();
  // }
  //
  // @pragma('vm:entry-point')
  // static Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  //   await Firebase.initializeApp();
  //   if (message.notification == null) {
  //     handleNotification(message, true);
  //   }
  // }
  //
  // static Future<void> foregroundNotificationHandler() async {
  //   foregroundStream =
  //       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //         if (message.notification == null) {
  //           handleNotification(message, false);
  //         }
  //       });
  // }
  //
  // static Future<void> terminatedStateNotificationHandler() async {
  //   FirebaseMessaging.instance.getInitialMessage().then(
  //         (RemoteMessage? message) {
  //       if (message == null) return;
  //       if (message.notification == null) {
  //         handleNotification(message, false);
  //       }
  //     },
  //   );
  // }
  //
  // static void onTapNotificationHandler() {
  //   onMessageOpen = FirebaseMessaging.onMessageOpenedApp.listen(
  //         (RemoteMessage message) async {
  //       final data = message.data;
  //
  //       switch (data['type']) {
  //         case Constant.notificationTypeChat:
  //         case Constant.notificationTypeOffer:
  //           if (data['type'] == Constant.notificationTypeOffer &&
  //               !HiveUtils.isUserAuthenticated()) {
  //             Get.toNamed(Routes.notificationPage);
  //             return;
  //           }
  //
  //           Get.to(() =>
  //               ChatScreen(
  //                 profilePicture: data['user_profile'] ?? "",
  //                 userName: data['user_name'] ?? "",
  //                 itemImage: data['item_title_image'] ?? "",
  //                 itemTitle: data['item_title'] ?? "",
  //                 userId: data['sender_id'] ?? "",
  //                 itemId: data['item_id'] ?? "",
  //                 date: data['created_at'] ?? "",
  //                 itemOfferId: int.parse(data['item_offer_id']),
  //                 itemPrice: getPrice(data['item_price'])!,
  //                 itemOfferPrice: getOfferPrice(data['item_offer_amount']),
  //                 buyerId: HiveUtils.getUserId(),
  //                 alreadyReview: false,
  //                 isPurchased: 0,
  //               ));
  //           break;
  //
  //         case Constant.notificationTypeItemUpdate:
  //           Get.offAllNamed(Routes.main);
  //           MainActivity.globalKey.currentState?.onItemTapped(2);
  //           Get.find<FetchMyItemsController>()
  //               .fetchMyItems(getItemsWithStatus: selectItemStatus);
  //           break;
  //
  //         case Constant.notificationTypeItemEdit:
  //           String id = data["id"] ?? "";
  //           DataOutput<ItemModel> item =
  //           await ItemRepository().fetchItemFromItemId(int.parse(id));
  //           Get.toNamed(Routes.adDetailsScreen, arguments: {
  //             'model': item.modelList[0],
  //           });
  //           Get.find<FetchMyItemsController>()
  //               .fetchMyItems(getItemsWithStatus: selectItemStatus);
  //           break;
  //
  //         case Constant.notificationTypeJobApplication:
  //           Get.toNamed(Routes.jobApplicationList, arguments: {
  //             'itemId': int.tryParse(data['item_id'] ?? '') ?? 0,
  //           });
  //           break;
  //
  //         case Constant.notificationTypeApplicationStatus:
  //           Get.toNamed(Routes.jobApplicationList, arguments: {
  //             'itemId': 0,
  //             'isMyJobApplications': true,
  //           });
  //           break;
  //
  //         case Constant.notificationTypePayment:
  //           if (HiveUtils.isUserAuthenticated()) {
  //             Get.toNamed(Routes.subscriptionPackageListRoute);
  //           } else {
  //             Get.toNamed(Routes.notificationPage);
  //           }
  //           break;
  //
  //         default:
  //           if (data["item_id"] != null && data["item_id"] != '') {
  //             String id = data["item_id"];
  //             DataOutput<ItemModel> item =
  //             await ItemRepository().fetchItemFromItemId(int.parse(id));
  //             Get.toNamed(Routes.adDetailsScreen, arguments: {
  //               'model': item.modelList[0],
  //             });
  //           } else {
  //             Get.toNamed(Routes.notificationPage);
  //           }
  //       }
  //     },
  //   );
  // }
  //
  // static Future<void> registerListeners() async {
  //   FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  //   await foregroundNotificationHandler();
  //   await terminatedStateNotificationHandler();
  //   onTapNotificationHandler();
  // }
  //
  // static void disposeListeners() {
  //   onMessageOpen.cancel();
  //   foregroundStream.cancel();
  // }
}