import 'dart:async';
import 'package:e_commerce_app/core/theme.dart';
import 'package:e_commerce_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_text.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

// class ChatMessageHandler extends GetxController {
//   static final ChatMessageHandler to = Get.find();
//
//   RxList<Widget> messages = <Widget>[].obs;
//   final RxList<Widget> _chat = <Widget>[].obs;
//
//   void add(Widget chat) {
//     _chat.clear();
//     _chat.insert(0, chat);
//
//     messages.value = [..._chat, ...messages];
//   }
//
//   void loadMessages(List<Widget> chats, BuildContext context) {
//     List<Widget> messagesWithDate = [];
//     String previousDate = "";
//
//     DateTime now = DateTime.now();
//     DateTime today = DateTime(now.year, now.month, now.day);
//     DateTime yesterday = today.subtract(const Duration(days: 1));
//
//     for (int i = chats.length - 1; i >= 0; i--) {
//       DateTime date =
//       DateTime.parse((chats[i] as ChatMessage).createdAt).toLocal();
//       String formattedDate;
//
//       if (date.isAfter(today)) {
//         formattedDate = "today".translate(context);
//       } else if (date.isAfter(yesterday)) {
//         formattedDate = "yesterday".translate(context);
//       } else {
//         formattedDate = (date.toString()).formatDate();
//       }
//
//       if (formattedDate != previousDate) {
//         messagesWithDate.insert(0, messageDateChip(context, formattedDate));
//         previousDate = formattedDate;
//       }
//
//       messagesWithDate.insert(0, chats[i]);
//     }
//
//     messages.value = messagesWithDate;
//   }
//
//   Widget messageDateChip(BuildContext context, String formattedDate) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(7),
//             color: context.color.territoryColor.withValues(alpha: 0.3),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: CustomText(formattedDate),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void flushMessages() {
//     messages.clear();
//     _chat.clear();
//   }
//
//   void removeMessage(int id) {
//     List<Widget> msgs = [...messages];
//     msgs.removeWhere((element) {
//       if (element is! Padding) {
//         return ((element as ChatMessage).key as ValueKey).value == id;
//       }
//       return false;
//     });
//     messages.value = msgs;
//   }
//
//   void updateMessageId(String identifier, int id) {
//     try {
//       List<Widget> msgs = [..._chat];
//       for (var i = 0; i < _chat.length; i++) {
//         if (msgs[i] is BlocProvider) {
//           Widget? bloc = (msgs[i] as BlocProvider).child;
//           ChatMessage chat = (bloc as ChatMessage);
//
//           String chatKey = (chat.key as ValueKey).value;
//
//           if (identifier == chatKey) {
//             var map = chat.toJson();
//             map['key'] = ValueKey(id);
//
//             try {
//               ChatMessage chatMessage = ChatMessage.fromJson(map);
//               _chat[i] = chatMessage;
//             } catch (_) {}
//
//             messages.value = [..._chat, ...messages];
//           }
//         }
//       }
//     } catch (_) {}
//   }
// }
